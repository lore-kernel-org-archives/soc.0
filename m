Return-Path: <SRS0=pHIv=HT=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BC2C433E6
	for <soc@archiver.kernel.org>; Wed, 17 Feb 2021 01:17:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 118ED64E79; Wed, 17 Feb 2021 01:17:04 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C746264E2F;
	Wed, 17 Feb 2021 01:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C746264E2F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pj1-f45.google.com with SMTP id d2so552751pjs.4;
        Tue, 16 Feb 2021 17:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
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
        b=Br4WClNDc09EZWUPVd0PzpaHWLDOcRlLEBSXwABHrPhYtZ+6ipchSB2mCdkhBT3yrP
         0pbVHzcZ2qvAYyKdEhHKDsjKV6vDVgLPwGBEe7I8N2AloP2NYl9qW9mOUfikM101XUje
         SHiI5dt01eGFtNbxhTnsEXsNSRxL+aR0qeLrCgiZMwllrZVm44SJxlkBIoPBHqWy0qWh
         9KksSvDXNqRb5GR0OmHw+SYrLqL98mxwXZbOEuW8kZ1TW2C3LZMjeQgsQlLdTdJCBdYp
         R2Ih5cqGgK0FY4biBlFY1TysYWnkkECa8UAvQS3pX3cWj/eM4V/q4jje7xvNVimUD4mx
         rt9Q==
X-Gm-Message-State: AOAM533+K+EuTSY0zxVIaChupupNoac/oHJ+f9RdpEeMmcLh+NWFXWk+
	T4lxaE6hcpTIHc2VFDsm3tZ58rh0+Qo=
X-Google-Smtp-Source: ABdhPJxXJ+TkKMgQHnCMQgVHisBWUajjHREpMShokoYCGIVpT6BbqN6UWem/X854K06f6nJFbU5Urw==
X-Received: by 2002:a17:90b:410d:: with SMTP id io13mr3260666pjb.68.1613524623044;
        Tue, 16 Feb 2021 17:17:03 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id f3sm316046pgh.75.2021.02.16.17.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 17:17:02 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/2] Broadcom late drivers changes for 5.12
Date: Tue, 16 Feb 2021 17:16:54 -0800
Message-Id: <20210217011654.2561426-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217011654.2561426-1-f.fainelli@gmail.com>
References: <20210217011654.2561426-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
