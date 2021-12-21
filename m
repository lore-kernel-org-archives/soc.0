Return-Path: <SRS0=MANq=RG=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02310C433EF
	for <soc@archiver.kernel.org>; Tue, 21 Dec 2021 22:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C4D89C36AEB; Tue, 21 Dec 2021 22:06:46 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2552BC36AE9;
	Tue, 21 Dec 2021 22:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2552BC36AE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id lr15-20020a17090b4b8f00b001b19671cbebso575107pjb.1;
        Tue, 21 Dec 2021 14:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PDzsIf6Uhe1lbJBaXlITABiQo6ZivW3lcMWFYi+LrqM=;
        b=McaKDmieIboD6xGZOXSQbODid7BEVpVEoKweit/95ENAZWt2tDWubkXgoe58NtgBtY
         OkwJOfNZKri7bO6RYW8PLwiht8hSD3h1n0kb990exvrl5zyCpCmnOGQ7x4/X0d8UubQ0
         Bu0zQo7SdPxs5GGwxLSeFxMZ59BMdQer7UqTUBH1idPnhW0/M9bS0I3DashqxfWGFgna
         thvBfMbbO65Ddsy3egrb4uIvcDDseYjgQ/cIfbGj96SuCWHPUrYLmoMOVBIxbFrmwDsh
         nfHojGOh4baKk2VV30wtC4mXirIM4iI1lVD7ZMCLzd95KKUNKGfavGt4F/cSV5vapcfi
         m+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PDzsIf6Uhe1lbJBaXlITABiQo6ZivW3lcMWFYi+LrqM=;
        b=MKxj+QhiBtfGJHTNuRHQtoNTvi+eEVtZ7eHabX7cOVAiCtK+nGRSjpCcoreCYqbOEw
         HwrsNWqgwqzU4qxOO1fwkWvly6EjqvN1uqYQfzNs+ipmSqbf7eDwKTJ4dmknid5nUpiO
         6baWW6XkxUjhx31sYePzP2cLQb0Yo2i73wA8YJV/7HALHNWrlQT66H8YeLGtVmNp8qjT
         kDB3K01X7Hbi8Vx6g8C4YNi5NrwDG3f7DNlyZFe5bbTEMnNfirS9XuG0+k4FlWRPGlcx
         4kiv86lcgnXfWKH+SWpRycUoM8JMBnF81H3SHQbWFvtQdOmTI3OpcewKAwnLuHDciCvU
         AJOg==
X-Gm-Message-State: AOAM533ehj9xSfn7PT5GgoDFGM/Enrbj3j7wCvki55QVRn+9n+uwhGYH
	LiDKlwMiZ7OGut+CyZIGOOG6tyTHZa0=
X-Google-Smtp-Source: ABdhPJxuTgkUY9N4HBoQkzAXM056RMYy5vU/Xdz7zTV0Wey7Aaz8yub7R1OL/P4JJleGCmYLfX8Fng==
X-Received: by 2002:a17:902:9882:b0:143:91ca:ca6e with SMTP id s2-20020a170902988200b0014391caca6emr71840plp.64.1640124405229;
        Tue, 21 Dec 2021 14:06:45 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id q190sm70342pgq.38.2021.12.21.14.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 14:06:44 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/6] Broadcom defconfig changes for 5.17
Date: Tue, 21 Dec 2021 14:06:37 -0800
Message-Id: <20211221220642.2862218-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.17/defconfig

for you to fetch changes up to 28df783bfcbb19ba1df921985aac7fa8b7ee59d0:

  ARM: multi_v7_defconfig: Enable BCM23550 and BCM53573 (2021-11-15 09:55:58 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs defconfig changes for
v5.17, please pull the following:

- Florian enables the Broadcom USB PHY driver and the USB host drivers
for Broadcom STB as well as support for the BCM23550 and BCM53573 SoCs
in the multi_v7_defconfig file

----------------------------------------------------------------
Florian Fainelli (2):
      ARM: multi_v7_defconfig: Enable Broadcom STB USB drivers
      ARM: multi_v7_defconfig: Enable BCM23550 and BCM53573

 arch/arm/configs/multi_v7_defconfig | 4 ++++
 1 file changed, 4 insertions(+)
