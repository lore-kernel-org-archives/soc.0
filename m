Return-Path: <SRS0=4HkZ=LE=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE35C48BDF
	for <soc@archiver.kernel.org>; Thu, 10 Jun 2021 19:48:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 046DC61419; Thu, 10 Jun 2021 19:48:44 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEDDC61412;
	Thu, 10 Jun 2021 19:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEDDC61412
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pf1-f170.google.com with SMTP id k15so2499029pfp.6;
        Thu, 10 Jun 2021 12:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iXDY5en0aj/GRwV5MqPL/tJ51DVClCLsJNEI9eOFIb0=;
        b=SakiHlE2WD/E1EnCjqsGOhPTdX/XgZSKaFf3oPyeGHCpqHo1insKWsndI81YFK14su
         kVd0OL+KX1AbyWpBHQmTQ/QVwQRFU1fOQLvUDzqbweCAXMZP0AjFpai7L8nuql0KJdDW
         8Dug4n2xbx5Fy6UtJjt2YEajrH4uiVBBOLqhtiCdxz8Ua0k8PDDlrc2slrtv+zgMv6tQ
         KwlBH1aFvDNEePb2I25cOtaW6AxwjoJkncsnd6y6sDkm9xDTJkOEW+iMDQ3i8ojJgqZ8
         VDRiDLgfoc8yoroMXTBLqbyy+AXBMXNkdaAjSRkKebwthCfzWAA3VZ5/FDCd0TuKvu5a
         DPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iXDY5en0aj/GRwV5MqPL/tJ51DVClCLsJNEI9eOFIb0=;
        b=GDtraWdmXBX94fEMD4p3Z63OntzGbSvnUFjA65wnhw4eZH+FBqoyIxS6Q9P0lCtzVC
         gl21XnXVhrh1n6+PybFvqVL6CdTOi/PcxZQKgcxwJsjQiKYqF/0ulTmdEXTWlqAJvQpE
         UDT1hkn31yCTl+SG1dOo5GvsoYI1P/y7294Pprt3WUr4lefzC4oFZpSATgljf0hghRTm
         4anYIvYEadjkuB4o41upGVOntxHNmP7t38MbqZ/6N3fehBKZuVQfED8JjzEBh5e5BcQC
         NwVSkLyaUA9q/wMJ/NM3UiWewIk3Ttv3CDS1u/CWPk/PqwP/mUEEoDj1yaSH0Ma5MYsZ
         xJBQ==
X-Gm-Message-State: AOAM533kQe8v6C44alvuECW+H7C0EIrdRJhoVQl1EHzoZc2laBJmRhLI
	edd7+lZrb9zpppdprPh2RE/9fQOixEA=
X-Google-Smtp-Source: ABdhPJwhpAAjlnuovQRj027/rv1KPncoE/EtqCDegGM5xB+3HbiqHuhkfqdHLPJpX9nvE/7h7uzntw==
X-Received: by 2002:a65:5bc6:: with SMTP id o6mr60630pgr.364.1623354523118;
        Thu, 10 Jun 2021 12:48:43 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id oc10sm3118297pjb.44.2021.06.10.12.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 12:48:42 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/3] Broadcom drivers changes for 5.14
Date: Thu, 10 Jun 2021 12:48:36 -0700
Message-Id: <20210610194836.309869-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610194836.309869-1-f.fainelli@gmail.com>
References: <20210610194836.309869-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.14/drivers

for you to fetch changes up to c1f512182c54dc87efd2f7ac19f16a49ff8bb19e:

  soc: bcm: brcmstb: remove unused variable 'brcmstb_machine_match' (2021-05-10 14:50:36 -0700)

----------------------------------------------------------------
This pull request contains Broadcom SoCs drivers changes for 5.14,
please pull the following:

- Jiapeng removes an unused variable in the Broadcom STB BIU driver
  causing an unused warning.

----------------------------------------------------------------
Jiapeng Chong (1):
      soc: bcm: brcmstb: remove unused variable 'brcmstb_machine_match'

 drivers/soc/bcm/brcmstb/common.c | 5 -----
 1 file changed, 5 deletions(-)
