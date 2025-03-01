# Use official AWS Lambda Node.js image
FROM public.ecr.aws/lambda/nodejs18.x

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install --only=production

# Copy application files
COPY index.js ./

# Set the Lambda function as the entry point
CMD ["index.handler"]
 
