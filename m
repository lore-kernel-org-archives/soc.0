Return-Path: <SRS0=Q6KY=HT=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99059C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Feb 2021 01:18:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44FA564E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Feb 2021 01:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44FA564E57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Yqy/GYIyxcSO7t0XIh0WPtQjP+HMxlc44ikVPkBRqNk=; b=xMt9rM7tjc8Ijz9ezclWll/to
	lIcwJSMll6/2lYxh10wBMrl186gEFzFUbpF1SNl0UnwNdmRY/uq6g85b0UhSUHphu1ElyN1ZkxGxw
	H4hFfHulHTs/MrI6FlPa/Dg5gUTkMlETbaeWHQQMjUwbfoq9wEOokihKQ374VWFYGeClQjeGM/mEI
	lfN2WmTjg9sh4OdZRhXMji4sMOiMwXY9YoZ0vDg/px4NEmaQ5WbbPJb8qU/gakjCGoiTj0OTDKyDL
	MO+4L6T9SBQK+azw6svwtSgCrOTmQFUnk5DDz4N4c2Sba93yMaL2gcbPy8NmhjHxVaiKptnjMAf/N
	jA5cLJ3Uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCBSq-0005De-0M; Wed, 17 Feb 2021 01:17:12 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCBSk-0005CA-4i
 for linux-arm-kernel@lists.infradead.org; Wed, 17 Feb 2021 01:17:07 +0000
Received: by mail-pl1-x630.google.com with SMTP id f8so4917737plg.5
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 16 Feb 2021 17:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VC8mFVpBkd3XjnulZt1KtNe/EgtH5Xa5A7VuRQLB5bk=;
 b=VGkE7zQjSi/MXJDiQ06A+q4+kWCf+fgHycd9I6KT76EGN6M8OKnhcdpaRphXNI9jxm
 KUopUh23uILJ1cOOnsOgNTlXa50CXq/zJqWDj1OUfpbuY1ks6yBYOrLOTP4/3hGKl8Ua
 n6Tfk22NIn/uQMMnZLS1nLTXotmQTUs3N9JbSbD437UJl32zKqEHcwr7nCgRch84mVRw
 Llg8pQQRtDQ4SPwixCqDn0RlDMBgXq8FfkEVCA+aK9xJ6KLqS9LBYPO4z23y1w96DI0h
 eYav9XmVjO7Dlgdk1ZRRvrfEj/flKKXqzMZdzycEPOTiino2JS58Kj9L/lnKX/ry4LQb
 9f0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VC8mFVpBkd3XjnulZt1KtNe/EgtH5Xa5A7VuRQLB5bk=;
 b=Xsln1RG+SAXhN+tCo3PjS2H9WM1ZZad91qkcvVniagu9WJ+wjVVmGiSNpdpZl+4mku
 JK2ERj6KjI8X/XtwYtGBYYlemRhV21xUjAZ5nyixfZytN1fXvdThiPTP3iaqeSmeG/Ub
 Bp8aM6J5kIs8E7NRjL2Trkd6cSe/+kceE2ZIxEeaxHl2+PXRvN00d+vg/Us3/l9O7N+k
 GZzABq6uubj72LJ33Ap+YcYWDrTjoOhQnImavq1S2cvEn+T+fKAtPm7G/vqBmKqPv2uC
 PSIsULRSHcTg1YwcPWpDRBwIMKGiKNUj/NfNTuKK1uEIuCqk7xMBYDfBrU1rJZG6YNJw
 hxpQ==
X-Gm-Message-State: AOAM530tPcVUefHKr05flVaVWYXc8nHMB1Q1b9YgsJ6M7xt7oJ+7PUd/
 vHNE7TSVyHsQEvrBeVIycZc=
X-Google-Smtp-Source: ABdhPJxXJ+TkKMgQHnCMQgVHisBWUajjHREpMShokoYCGIVpT6BbqN6UWem/X854K06f6nJFbU5Urw==
X-Received: by 2002:a17:90b:410d:: with SMTP id
 io13mr3260666pjb.68.1613524623044; 
 Tue, 16 Feb 2021 17:17:03 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id f3sm316046pgh.75.2021.02.16.17.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 17:17:02 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 2/2] Broadcom late drivers changes for 5.12
Date: Tue, 16 Feb 2021 17:16:54 -0800
Message-ID: <20210217011654.2561426-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217011654.2561426-1-f.fainelli@gmail.com>
References: <20210217011654.2561426-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_201707_031006_79E25DC1 
X-CRM114-Status: GOOD (  10.92  )
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
 olof@lixom.net, bcm-kernel-feedback-list@broadcom.com,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210217011654.1bE_8QjHBsQL1RAIUMFgXQ6ohtHswnCIURQUtMz6Es8@z>

The following changes since commit 8b8f095b9076ca61107c0910c9273afd1dfa1f04:

  soc: bcm: brcmstb: Remove soc_is_brcmstb() (2021-01-27 09:36:41 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/drivers-part2

for you to fetch changes up to b22ac48b0a4d74415beef10e49e434e8f228a2bf:

  MAINTAINERS: rectify BROADCOM PMB (POWER MANAGEMENT BUS) DRIVER (2021-02-08 13:19:23 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM/ARM64 SoC drivers changes for
5.12:

- Lukas fixes an incorrect entry of the Broadcom PMB driver which still
  referenced the location of the files from a previous submission

----------------------------------------------------------------
Lukas Bulwahn (1):
      MAINTAINERS: rectify BROADCOM PMB (POWER MANAGEMENT BUS) DRIVER

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
