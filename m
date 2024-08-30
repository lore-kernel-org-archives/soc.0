Return-Path: <SRS0=qcKZ=P5=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B8CCA0FFC
	for <soc@archiver.kernel.org>; Fri, 30 Aug 2024 14:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7600C4CECC; Fri, 30 Aug 2024 14:11:53 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1C316C4CED3;
	Fri, 30 Aug 2024 14:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1C316C4CED3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-371b97cfd6fso1415155f8f.2;
        Fri, 30 Aug 2024 07:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725027008; x=1725631808; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8AI/Fdop6iHv+uoGGlpuSZ/Od9olmbw4mbRVXSNvW8=;
        b=J4BK2Q/lzriEdPPzAnawonVSSt+P3nIkDImAHgUcooOF2Kd1+zJ/owxYJXpZKGSCWq
         4Sn4XLP0986sduY3AlIlWyDdUHfWL1gpRfY79s3VM6sLFuYjcizkUnavVufXc9BekYXQ
         xDNZ2s9BO5zjB7KYqV2tuxuDL2uektxwk2OMdgtg8ZCqYGZTSIRlZ48M0hRJb1P/e97l
         X4khP3b7UVnafit5gB6S3R1kcRFNGjMd3EuwRmA6j+pD0z6Npdk1FnEyiKaXElBIOhCO
         BKkPbCZ5iSAKHKMhXhpdYQsEPXQ7RTXuZwLsiELHEbQ3NEeV5XB1uYong4VPMLY5pk0y
         jJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725027008; x=1725631808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8AI/Fdop6iHv+uoGGlpuSZ/Od9olmbw4mbRVXSNvW8=;
        b=fUJ+utx/MxR4H53dbKqDvtqbP+weDU+PFOaQMhQLg7uC3r0Z/6mui4uOU9DOU4+Vz6
         iqWmH+2wFPD1TimM65b+OHybU7pqsXFAWZ8nYnEBEmU96ay9MAAzrjgp49qk8uBML2TZ
         /RGlSoFgPa4t1bMydIf5K5y4TcZ3Ci+w7QUinqRJYDU22Bl7eMJU4dyNh079z5sux4Jw
         56l4kYb5NCYKJK3T/aMaYkVrko79cIATJfl+zXpRbBLQni2M8jc4oIdGOOdiufve4WY6
         zoLGkVgY2W9f5QkUsN0QgxU+qfUBTTXqdS1+WAdNijcVe5Mu5+tu6M0vPc+gTThAjfrP
         Q1JQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4uBI1NV+FRshoPrK+UqDniL7NJAghMH5/jUt7DYBsLAxIXRPeJMTMBUIiiajpdyuS3hI=@kernel.org
X-Gm-Message-State: AOJu0YyCove8NfN912LPA7V/mAc7Lg6IzcuYcrdUk/EjyMLto2hMQC7r
	tbgWkRHm0fzArb1UndiidjmZMQIjWSU8JsTZ/HWoamhbFaWRLf4ROmw56Qnf
X-Google-Smtp-Source: AGHT+IFiVV4FognpxJjECOXOy15naDCNUq2hzOneZZRh2PLbxhNsakYmHArm/JlTqzgGmCEZkbrlvQ==
X-Received: by 2002:a5d:400c:0:b0:371:8c27:4ce8 with SMTP id ffacd0b85a97d-374a959e353mr1606496f8f.27.1725027007382;
        Fri, 30 Aug 2024 07:10:07 -0700 (PDT)
Received: from localhost (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e27c70sm47297005e9.35.2024.08.30.07.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:10:07 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] dt-bindings: Changes for v6.12-rc1
Date: Fri, 30 Aug 2024 16:10:00 +0200
Message-ID: <20240830141004.3195210-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830141004.3195210-1-thierry.reding@gmail.com>
References: <20240830141004.3195210-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.12-dt-bindings

for you to fetch changes up to c20ebc7fbd2ac3af28e8c712cdaf5b20b524bfba:

  dt-bindings: arm: tegra: Document Nyan, all revisions in kernel tree (2024-08-29 17:24:49 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.12-rc1

This adds compatible strings for all revisions of the Nyan board.

----------------------------------------------------------------
David Heidelberg (1):
      dt-bindings: arm: tegra: Document Nyan, all revisions in kernel tree

 Documentation/devicetree/bindings/arm/tegra.yaml | 42 ++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
