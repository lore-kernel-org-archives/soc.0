Return-Path: <SRS0=+HJT=L7=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A210CC04FFE
	for <soc@archiver.kernel.org>; Fri, 26 Apr 2024 18:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7D88FC113CE; Fri, 26 Apr 2024 18:05:31 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A92BFC113CD;
	Fri, 26 Apr 2024 18:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A92BFC113CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41b6254a47cso15971325e9.3;
        Fri, 26 Apr 2024 11:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714154728; x=1714759528; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=er1tYyCt13uPsO0y7NV434ai1ZywuWVo5RfP9WCPdB8=;
        b=YmrHeNxRsL1D0hcNzmzw/2XsnyTOIMqqM1ea2hEMfV2CvJSQ9GaIar7BB50a1HzktL
         222/YaUYPi3jmS3/KknOezvoRmfgYaB5ZTy+5Sin0aJVv8CcAsYi1sNpVDqWFW5ChDqO
         TJtEoi5cbJOqyoVJPKGcYKOEZ3A1Jc8lEOI4+JzeW07/NGl9gYZpDWWoM/AJvd74gZoO
         0lX5sKL8SyLf4Z6LwVQhNCj8Zitnqd+c9sAGG/ynr3Ryl0BFEN2oKSLI5x56c/vP1Pk0
         os88udUFrQkL2hk3TxQcik4fwECUD7XpiJHEIKVuPFChcPXI8MdSIeF5t9zfHR/rfLuX
         kBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714154728; x=1714759528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=er1tYyCt13uPsO0y7NV434ai1ZywuWVo5RfP9WCPdB8=;
        b=F6P8Ary11G/O3G9Pv8VTQautNePYvZ8nkfi/0hnN5ebgOEYWImPhaev01vrRPLEjDL
         cJEL5raCOeBXD5dgmWI1JCNYcymCHCfq65Sj5TtC5H97Ickq1AZwrZtdDbbh7W5bXUMz
         KCwVr9sM94c2WyhNFubJ1OYSydMQpv4T1LNosasPL7AOEkHq1/14Eq6XfwkE+hOU/nbP
         NXIY0h3EPt0R5MzfImYtkach/3KeGjbjybz4/X28pE6CJkZj0IfS+PtlLsWa8nAM0gHm
         q8ARzMqPdLyUa+mBnjMPO48oQY4IHuTX0Z9/dwR+8E1QhsopAdzEG6zre2Nw3855M+G+
         poqA==
X-Forwarded-Encrypted: i=1; AJvYcCWVy8Js48AkT9mmUeCUoc4wff6MrWIwykZtRBbri4OuxGxvWy0aBFaYhYht4GyECcTOxjaEoN6JanyGfrlCzw==
X-Gm-Message-State: AOJu0YyEgt4rRmw7Ob1R0Na6hceHbvdQTf3wbQ3LLdRB1KtRkdwG+xp8
	k2jO+Okgw1TSW9SKYzy2rN6JO0MjCSbNJeDghHpFurDnp286jRqpQhQBDQ==
X-Google-Smtp-Source: AGHT+IFcGcZCotuCyyjLiLREkMlEbMqXPS5b/W/si5dCVYGHCJyr+6QukDeZbLs7p4POeeWWspc+jw==
X-Received: by 2002:a05:600c:3b24:b0:418:7c58:d592 with SMTP id m36-20020a05600c3b2400b004187c58d592mr2745550wms.28.1714154728307;
        Fri, 26 Apr 2024 11:05:28 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c4f1000b0041a1fee2854sm20946523wmq.17.2024.04.26.11.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 11:05:27 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/5] arm64: tegra: Changes for v6.10-rc1
Date: Fri, 26 Apr 2024 20:05:17 +0200
Message-ID: <20240426180519.3972626-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240426180519.3972626-1-thierry.reding@gmail.com>
References: <20240426180519.3972626-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.10-arm64-dt

for you to fetch changes up to 0d23cacb2ae0fc9d8d40f36cb37ad272b3249ffe:

  arm64: tegra: Add Tegra Security Engine DT nodes (2024-04-26 18:57:11 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Changes for v6.10-rc1

Adds the Security Engine devices found on Tegra234 and fixes RTC aliases
by referencing them by label rather than path so that errors can be
detected more easily.

----------------------------------------------------------------
Akhil R (1):
      arm64: tegra: Add Tegra Security Engine DT nodes

Krzysztof Kozlowski (1):
      arm64: tegra: Correct Tegra132 I2C alias

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts |  4 ++--
 arch/arm64/boot/dts/nvidia/tegra132.dtsi       |  2 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi       | 16 ++++++++++++++++
 3 files changed, 19 insertions(+), 3 deletions(-)
