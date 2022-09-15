Return-Path: <SRS0=XNjI=ZS=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7005AC6FA82
	for <soc@archiver.kernel.org>; Thu, 15 Sep 2022 02:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 57AF9C433D7; Thu, 15 Sep 2022 02:30:59 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7DDDDC433C1;
	Thu, 15 Sep 2022 02:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7DDDDC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id h28so12336316qka.0;
        Wed, 14 Sep 2022 19:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=H2XP+ezeMy2U6LiXg3CUTKvpnFFwiCPvasJkiXmPkaM=;
        b=Tl7tL2U3wQZTE2q6G7Z9hdSH9BWp8YiG0+2RC43uez6yvd7iAKKRSC9nvescOZqQIq
         aCHF17QCURcYuQOGVKOpRok5tFfW25hlB62uUK1CNVZrtRm3QihN6JUQ8Xlb7IUYkvn5
         jsIOQ+j1DT1nyu99IwFRsmJlBhhu9M+k6sP/Wy9d+gqlus2DFRX5CqpOx2rOOg2SN+I9
         4mh6OlVK+H35/RH4seCHNvaePn37FM3wZoV+R8K5kGX5FVWwVSFq5n3TWaxDDKZjsqT0
         ltxpKsGc+mPVs7s3g9dUU9IGr0bfbH2IEjuwI0FnW6sQiyYy0mhvgg4KXOP3mGK6EYMs
         0bHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=H2XP+ezeMy2U6LiXg3CUTKvpnFFwiCPvasJkiXmPkaM=;
        b=DZFsDuzmlLhWGuuIOnvwyJ8UDvzvLk0wFIujwxZCU7FjDjOxaS9uUs5Wc16cNoxa8d
         0knRx88xO+uqDKlyCchLMKpwVMdIgiEvYfYGKSX/UE1SnYCq9QwFRNy1gqZ+J9bBnhAE
         BGLyTC+bo9oLZzvKWKEgKwQe1UP29WdVQRZ1NVCffNhoDQT629lyJ6Ip8TXxwzOo92Jk
         QbO9DS+tD8MNyD1qiNIo8v3pTI4+GJOSKSGDOo5QXwmSySCbLLPqD6UsEKtU6RJCV9ty
         opx4rMzhBSKTR0/bWmcj5JsnLMvhk89VFMBo++BtSEyiOxt6RQUS3hjwDnItBnyXEaDI
         GJUA==
X-Gm-Message-State: ACgBeo22B0z+T44qk8c9FOWypn4YHHi7WC0PXq3bLLlBmtvQLFUU8DW8
	FA4LAN0Ysy4HdB8ytJJVvVvnbN+Li54=
X-Google-Smtp-Source: AA6agR7LSBi8Xm3D8u7bM6N9ORs2Dj8cNAAyk/P2T7Wz2T3yO/Xjp9wWiV2a2hZc0xrN+04N5ITf7g==
X-Received: by 2002:a05:620a:254e:b0:6c7:855c:6eb with SMTP id s14-20020a05620a254e00b006c7855c06ebmr29782269qko.39.1663209056862;
        Wed, 14 Sep 2022 19:30:56 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id u16-20020a05620a0c5000b006bbe7ded98csm3062982qki.112.2022.09.14.19.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 19:30:56 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: William Zhang <william.zhang@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 5/5] Broadcom maintainers changes for 6.1
Date: Wed, 14 Sep 2022 19:30:44 -0700
Message-Id: <20220915023044.2350782-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915023044.2350782-1-f.fainelli@gmail.com>
References: <20220915023044.2350782-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.1/maintainers

for you to fetch changes up to 01bf00c52e9ea76862e8a12a0838006be1f2cb8f:

  MAINTAINERS: Add BCM4908 maintainer to BCMBCA entry (2022-09-12 11:27:13 -0700)

----------------------------------------------------------------
This pull request contains Broadcom SoC MAINTAINERS file update for 6.1,
please pull the following:

- William merges the ARCH_BCM4908 with ARCH_BCMBCA entry

----------------------------------------------------------------
William Zhang (1):
      MAINTAINERS: Add BCM4908 maintainer to BCMBCA entry

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)
