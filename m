Return-Path: <SRS0=WXVb=XQ=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E38C43334
	for <soc@archiver.kernel.org>; Mon, 11 Jul 2022 16:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5BD7FC341C8; Mon, 11 Jul 2022 16:45:17 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C24EC34115;
	Mon, 11 Jul 2022 16:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9C24EC34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id a15so5209502pfv.13;
        Mon, 11 Jul 2022 09:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p6UgfEEauM0ZnT98qW3uZiNWf2I/WEgiguAYyQtYDhE=;
        b=hwdqyhAHfV0Yk9qDwgAUGvmhiWB+P2ag5wXLlDql81fCj2+Rm8c9QRoT9/ux/g4WuT
         w75ztI4Fae3/+SW0iCcJ9n1Xp0tzphdg8TQWdEVqIUcdOWzNYTokLjrStnAvvkrCO+Q9
         bVdy2uIt528u+gYlckAXhbid/l4spcMBXuPMhIvix0aSw4qAZjsY0KYMF4qe4blfcVdF
         8DYEA5QqkgEgW6Hw/tLtLKVmEgjneuJh3zq+8t94x2daoaHVXFqVcFcGwcu2WqLiI1Je
         8oQ5csTipEPkqQdwuYe37ecqz+VY8pOsVswJ30PXbEhudvkunw91F595kBI2ROHCFoi9
         1d/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p6UgfEEauM0ZnT98qW3uZiNWf2I/WEgiguAYyQtYDhE=;
        b=3u67BlQre88K9qLGSohhsP71H28wdkxkeJ8IUqxm9moTkuIpArfkMoVZ2Uib84D42u
         yTgjAY3gFY43zRrSOs01bNQWYmZANBI8x3boYaQGcZVNgjfiazRxGyANtqLMnXsDu7fE
         wjqEJuJlwCpzdFnVjPUMO9c9GT5XvjsC3Bpl2EIGvnlOBEyAw+htvRkA4ljoPbmFtytw
         1kT3cOvW8BF8T2Gu3ns4RzY7ZX3jw1ZTcauiGSX4ODA/O9vv2wgPeTZXAGMy2SVddG7n
         48Pa3FbH939zp4q6+XXPt6Adw3uqVg2w7gNGVCkH7ZkvIJoukyJ6f5UD5sB7O32OESdR
         zVsQ==
X-Gm-Message-State: AJIora8U1Tn5zjGaynPgyj20RsXIMFdKkhjlI5Xsp7FdgQXYO3CRTvRJ
	4Rg1FiB0PlY3mEMi6i5MYE8IWDa5zNE=
X-Google-Smtp-Source: AGRyM1vmUlDANx0nljDpWGYbKc6Z9oSMyuaenliVO6bgRpbl9v+KzbAzpsNZBRj5YlvYne/9yK9EwQ==
X-Received: by 2002:a05:6a00:1504:b0:52a:e3ae:a603 with SMTP id q4-20020a056a00150400b0052ae3aea603mr500113pfu.48.1657557915890;
        Mon, 11 Jul 2022 09:45:15 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id v3-20020aa799c3000000b0052ab9f1fe45sm4961266pfi.120.2022.07.11.09.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 09:45:15 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: William Zhang <william.zhang@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Anand Gore <anand.gore@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 6/7] Broadcom maintainers changes for 5.20
Date: Mon, 11 Jul 2022 09:44:50 -0700
Message-Id: <20220711164451.3542127-7-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711164451.3542127-1-f.fainelli@gmail.com>
References: <20220711164451.3542127-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.20/maintainers

for you to fetch changes up to c510c81c0e59f83a7376e5febd2646b9166a7ebc:

  MAINTAINERS: Move BCM63138 to bcmbca arch entry (2022-07-08 14:06:51 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-SoC MAINTAINERS file updates for
5.20, please pull the following:

- William and Anand updates the MAINTAINERS files with new BCA SoCs
  entries for a variety of PON/DSL SoCs: 63178, 63158, 4912, 6858, 6878,
  6846, 6855, 6756, 63146, 6856, 63148, 6813. 63138 is now listed as a
  supported BCA platform and joins the families just added.

----------------------------------------------------------------
Anand Gore (3):
      MAINTAINERS: Add BCM63178 to bcmbca arch entry
      MAINTAINERS: Add BCM6858 to bcmbca arch entry
      MAINTAINERS: Add BCM6878 to bcmbca arch entry

William Zhang (10):
      MAINTAINERS: Add BCM63158 to bcmbca arch entry
      MAINTAINERS: Add BCM4912 to bcmbca arch entry
      MAINTAINERS: Add BCM6846 to bcmbca arch entry
      MAINTAINERS: Add BCM6855 to bcmbca arch entry
      MAINTAINERS: Add BCM6756 to bcmbca arch entry
      MAINTAINERS: Add BCM63146 to bcmbca arch entry
      MAINTAINERS: Add BCM6856 to bcmbca arch entry
      MAINTAINERS: Add BCM63148 to bcmbca arch entry
      MAINTAINERS: Add BCM6813 to bcmbca arch entry
      MAINTAINERS: Move BCM63138 to bcmbca arch entry

 MAINTAINERS | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)
