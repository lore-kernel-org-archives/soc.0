Return-Path: <SRS0=jEOm=TS=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7188AC433F5
	for <soc@archiver.kernel.org>; Mon,  7 Mar 2022 19:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58A89C340F6; Mon,  7 Mar 2022 19:48:27 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE20DC340EB;
	Mon,  7 Mar 2022 19:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BE20DC340EB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 6so9938161pgg.0;
        Mon, 07 Mar 2022 11:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hl1HzkLHtEplakdaIWYs6114JORKSHjGLXoa87caCsI=;
        b=I5v6scYDcYugOUeJ6cRWHQMpf5M+XsXDODCVhnqCbMTFOwzlVsWU8oNtQOpLEiw2Dw
         Qp4SbkzdYOzY/BopLY8o8P0IRGX3bWo8IX2LES9mO0vXrQ3jp4B62uxNsc4ieUCQOXdC
         5YUdLLjb/qyc66Sa8Yopzdd6WRKMAwni+2DBKJnlzQiL2fnp3EvLuhpRrtRxTP0HbAVL
         dXFIVyBEqE7E4bSgVAFg3pAXoMdp2OaWZck9K51+StclYUq5cEqgwdtm0+aJ/UOyT2Dr
         fAD12ZN7WxlGwPqoTrgGKW7ZW9AOth/mFyy1v7uEYiaKDME1Fs+aUeXyAHOdovWElCLj
         OMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hl1HzkLHtEplakdaIWYs6114JORKSHjGLXoa87caCsI=;
        b=xHRJj+phGMbE+VeA0PhuGg6Dk6u8Y0dIg8GBJrcc2DUTFen3jFDRbKiAs0YYS70LXZ
         bA53/qdmGXSElqAUISU1VOp9UbEpaPtHJPXQPlhzFF74HHZriHCsuc9Bp9RcMcm+mx2F
         RV1aY0+W5VxdIlwNYFaW2xgDX7E45Z+W/0cLUZXdbG5IujTNMJWtZ2TK3RsmtzK0/kQ1
         yC6lnarNX1rksMWPzR7NPn4TlCZ3/7Ms3dyCYlDQ4E5O31dPqH/cOs/SiDhMSjo2PsRc
         ZUzWVcsfgAd+2UMldemsP4jBJxYxUJxLfJ2NqaY8Dx4n/G3UEHApbKQe+SA3GgtolZm4
         IyEQ==
X-Gm-Message-State: AOAM532ETlYErZMFTmVbO80r3SOaYUq+bcyXbpb7hpMWp3PQzdi1k8ML
	QKLHmJ5CwcMjJSio8kcGamW3neiwpVA=
X-Google-Smtp-Source: ABdhPJzr3km/CagJSE0d39F+lLBM4FoHbCMijdpI8MNuw4ooRfXYEaTYktfoq7iiM0j2/JEYHck90A==
X-Received: by 2002:a05:6a00:16cd:b0:4e1:366:7ee8 with SMTP id l13-20020a056a0016cd00b004e103667ee8mr14484120pfc.9.1646682505934;
        Mon, 07 Mar 2022 11:48:25 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id s20-20020a056a00179400b004f709998d13sm4060092pfg.10.2022.03.07.11.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 11:48:25 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Kuldeep Singh <singh.kuldeep87k@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 4/4] Broadcom maintainers changes for 5.18
Date: Mon,  7 Mar 2022 11:48:17 -0800
Message-Id: <20220307194817.3754107-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307194817.3754107-1-f.fainelli@gmail.com>
References: <20220307194817.3754107-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.18/maintainers

for you to fetch changes up to 1860d30466366774055d993f9b31094ede8af415:

  MAINTAINERS: Update git tree for Broadcom iProc SoCs (2022-03-07 11:46:32 -0800)

----------------------------------------------------------------
This pull request updates the MAINTAINERS file for Broadcom SoCs, please
pull the following for 5.18:

- Kuldeep updates the Broadcom iProc entry to use the same up to date
Linux tree as the other Broadcom SoCs.

----------------------------------------------------------------
Kuldeep Singh (1):
      MAINTAINERS: Update git tree for Broadcom iProc SoCs

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
