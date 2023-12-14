Return-Path: <SRS0=A5Nd=HZ=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BA6C4332F
	for <soc@archiver.kernel.org>; Thu, 14 Dec 2023 13:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99421C433C8; Thu, 14 Dec 2023 13:41:44 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9ADF5C433CD
	for <soc@kernel.org>; Thu, 14 Dec 2023 13:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9ADF5C433CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a22f59c6ae6so277940966b.1
        for <soc@kernel.org>; Thu, 14 Dec 2023 05:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702561302; x=1703166102; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pGt/k/il8qEiARJPttZV9RuEkTEaCs+qP+NKhCHxIf4=;
        b=jPloUhEOcnU7CWStwapjavYFSUYkl8SCU6/JdQ9NHK9+Wftm8EnrvLYFEqPtci5y/J
         n8jC1khi+SlFjZ0oShzQNDjOrPmGMOsDL704akfyhb+NPaCw//6prh1hWgAFRgMcS1Di
         UHRqM3f7VtyQIf8g8+kKnyBItQnjim020vU+PIH+QYwm/oQmD/NYINVmPY6cxvogAKDF
         uXrCO5MW2PDqfYwM7cEwiR+t4GnZ/4yQKWc/egWS8lFCtkLHDRqpHNrLd+Ik2bPWXqYC
         MaDB6893nfwFmCUaFq3oHu4EG/WuAC/Kvx4kKXLckoF801XF6DdmcFDiGr9tqkqSXem8
         pfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702561302; x=1703166102;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pGt/k/il8qEiARJPttZV9RuEkTEaCs+qP+NKhCHxIf4=;
        b=bG56qofBTgfLFXJLV5EWB5qPrtuEa0M6TPJIA9scMbiVRpAqg4pczViXfOyYH/zMTB
         HGu3p7Tta+l9RCPoKtU9TT8WpG8gx8DSSzheyZUuhzOyYhZ6NjsL3tYncu5ghXoBbZKH
         kr7kPjRHh4ETuy0I1UdxzDqeveRXuOJMGLAJ/A2hWhMO0560Yicod4tERoKxD87AgP4l
         VYHM5VfbdEMjkeHu3tHENpZUT6EtW0zv1kqeIEx4n5ma9g5RJZTPWxz4JHO0/YMG1uKm
         w/+iZlgKUcLymGI8eVLz+V9MGn9bKJkgFUC2HD/2QsGwmvOuo2nr8JVdqVu/2FEe0L6N
         In0A==
X-Gm-Message-State: AOJu0Ywi1lTciUy87ChFjj9WQJND4MZez4AO8dqPydcFwmEzwVMSHEgY
	7C7V9pYsjeGLZA59mCn2gTXIIK+s4VkhJVgEhu8=
X-Google-Smtp-Source: AGHT+IF2cofLvud+LdRS9oONwHq3UkUQF4ckTTVenXO2ry2r2b7XfhqOyw+8A47d6qMRt/XOANCWaQ==
X-Received: by 2002:a17:907:3ac2:b0:a19:d40a:d21f with SMTP id fi2-20020a1709073ac200b00a19d40ad21fmr2105212ejc.235.1702561301850;
        Thu, 14 Dec 2023 05:41:41 -0800 (PST)
Received: from rayden (h-217-31-164-171.A175.priv.bahnhof.se. [217.31.164.171])
        by smtp.gmail.com with ESMTPSA id ld4-20020a1709079c0400b00a1df88cc7c0sm9276638ejc.182.2023.12.14.05.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:41:41 -0800 (PST)
Date: Thu, 14 Dec 2023 14:41:39 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] Improved TEE shared buffer support for v6.8
Message-ID: <20231214134139.GA3098718@rayden>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this patch to add vmalloc support for shared buffer
registration with the secure world.

Thanks,
Jens

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git tags/tee-iov-iter-for-v6.8

for you to fetch changes up to 7bdee41575919773818e525ea19e54eb817770af:

  tee: Use iov_iter to better support shared buffer registration (2023-12-13 07:23:22 +0100)

----------------------------------------------------------------
TEE: improve shared buffer registration compatibility

----------------------------------------------------------------
Arnaud Pouliquen (1):
      tee: Use iov_iter to better support shared buffer registration

 drivers/tee/tee_shm.c | 78 +++++++++++++++++++++++++++------------------------
 1 file changed, 42 insertions(+), 36 deletions(-)
