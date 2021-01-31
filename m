Return-Path: <SRS0=Fj/g=HC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A221AC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Jan 2021 22:19:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C13364E27
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Jan 2021 22:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C13364E27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h1IZqmMtkH/jHWLyhxVbSwXUidMIx9aMSmxzaB8qgxQ=; b=TCYUvHLZgCOWEYsB1S/QUMnDN7
	04juXSw1GsZIwNq1vmXLcye2le+5m+xFVY012clm4s3m0i4esh8xIHLdvuDxg5z0M3IiJndCsFxT+
	WCS8vBSzIohz7sEDURewziiY3qMmw15hXp2wQjZnwdEigeBFb89XUEaZzTNFmKgqIrkSL5Ot7Wj6i
	I+ni8zNCSgMsNuHsUCx9NWAXR4eLIKECyz3RmZjkTBMJK9JpywBwJJcthj2L7WrH32Swfn8rPpSAJ
	Hlc57DrZ3AcZkUnM/peT4pOpMtzqrhVIjlJ75cTECHxfTgz9KNG9WGdEIRte/K/1UOIlomyOJEuc3
	H33bSiLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6L2o-0000x1-DP; Sun, 31 Jan 2021 22:18:10 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6L2k-0000vf-Sy
 for linux-arm-kernel@lists.infradead.org; Sun, 31 Jan 2021 22:18:08 +0000
Received: by mail-pg1-x52d.google.com with SMTP id b21so10710954pgk.7
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 31 Jan 2021 14:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fQGpI2fGIe+9Ixx9I1K4oeU/85aYZYkAc9VcUwZmTLg=;
 b=EWoBsooeLkdolIjfjlbXqlEzi2ltwS3dWuvw7XIZG7VmzQ2VWcnUufT7FWuKMHxt/2
 ALjs5Aez683LQhbO4EnnrMWWa/mUYHlntGP7xkSo5qbqf7IUnAnMeuAwzu1YYZsgadlV
 Dw+5M7O3wBRzDj8sb/m44FEsWyeAX1XZwt1CtAQOI3K6XOCr7vWokA1FP/d/ORIbKi9t
 0Gr1f6hPIdClTHdfjQHhbbyMgEFYXNoXuNnuw3tZoUoHxGm7OSHcL4JunPXeqCMV5983
 37N3Wr0sO20C8q4X3DPfsOFMpCl8+4Bir5ioEj/u/jei1dEGCbLB+ieRSnwpe98oDwB8
 xooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fQGpI2fGIe+9Ixx9I1K4oeU/85aYZYkAc9VcUwZmTLg=;
 b=CF/sZFZlk+JvRd/pMVwVJ4OJ85ZXwpsFlJXPzaFjUpgZT6jBfmOt+ifeSfjUxaykvT
 nJ2oOC6z98/R5CEvIral6ZxDTgTe+SNDwvoUiEc2uS5k1Jk/dl3c6KP04iLSNW12Yndr
 6DyV5Uhb2hk6pOvfPPzeEw1iaNawgNpoo6joA6h6+B6nDoAnifAJFzz82cYPoTk8wogI
 ++/KHWoUi4yvqZrSH0C+wwuYerwtrH5JABmEe5W9LdOufqCrftTmepXjWCLl4hZkHYYC
 v4z1W3jYrojq4hWLhVPCU2wMMStq+tIlW2+7THh+XZn7/gfSsa7a4hCPS+fWbrGa4I9l
 nBQA==
X-Gm-Message-State: AOAM5334ebJa0fjX9bCoHkPBe/TSa1o+DnL4ZRe6T1PK4CGvRi4Cmz7u
 NaHr5m2lXZZK/L7L54QjY4E=
X-Google-Smtp-Source: ABdhPJzoeY1liWXItaCx8TheKxc7VnWGONysx3YFbj9epgMLJpjwYeAZNrtfMmqXXETAGQoqu0AG+A==
X-Received: by 2002:a63:2306:: with SMTP id j6mr11107451pgj.187.1612131483014; 
 Sun, 31 Jan 2021 14:18:03 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id a4sm15512177pfg.41.2021.01.31.14.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 14:18:02 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 1/6] Broadcom defconfig changes for 5.12
Date: Sun, 31 Jan 2021 14:17:15 -0800
Message-ID: <20210131221721.685974-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_171806_954441_5BB5AA41 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Florian Fainelli <f.fainelli@gmail.com>, arnd@arndb.de, khilman@kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, olof@lixom.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210131221715.gVGt3-W2isP3nusW2MSO8pgDJPpZfCplgLr3N0pp67Y@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/defconfig

for you to fetch changes up to d88b6b834872d51d76a951f89c761e7b12717962:

  Merge tag 'tags/bcm2835-defconfig-next-2021-01-25' into defconfig/next (2021-01-25 13:13:44 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs defconfig updates for
5.12, please pull the following:

- Nicolas enables the NVMEM reserved memory driver to permit reading the
  Raspberry Pi's bootloader configuration from user-space

----------------------------------------------------------------
Florian Fainelli (1):
      Merge tag 'tags/bcm2835-defconfig-next-2021-01-25' into defconfig/next

Nicolas Saenz Julienne (1):
      ARM: multi_v7_defconfig: Enable nvmem's rmem driver

 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
