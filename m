Return-Path: <SRS0=RnzU=ZV=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFF6C6FA82
	for <soc@archiver.kernel.org>; Sun, 18 Sep 2022 20:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 79AA3C433D7; Sun, 18 Sep 2022 20:50:44 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F8C6C433D6;
	Sun, 18 Sep 2022 20:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7F8C6C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id c19so17424772qkm.7;
        Sun, 18 Sep 2022 13:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=aQ0vYa3HCzCDqiVeQlyC/rgqErgRCaJrO7NMn2V/yHo=;
        b=MnZAW8hf7DgS8fmQHdjih8d8aDdNJ+hZ2p0PhIfRCfP1vdcTl3Y0xN5xttnvvG3IKe
         Hxo8b53dYjPuxXj6GG9BafnHkFYhq5e5rqWUiraL1yXk78Wp+QblsTTqYviKaS8t31RB
         +2lNDS+hOXSgg2t0k5uZ6NzPvtUSnEwNTM8fSO0xue7D6MIAjCy3ujmBSGzzvhdk+FEY
         CS9TethiCT0dGLbpP0cT408dvW3gpowKg7Pt7XY2qeTz31H12KwcwFxyNAhpYZmYo7aM
         scjoms9lfp6ZuismaaoNvwsZoJsaPGgdkPFn21WUekcLINKzMKVomb0BgQ95rVGrB63C
         wTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=aQ0vYa3HCzCDqiVeQlyC/rgqErgRCaJrO7NMn2V/yHo=;
        b=ZlmcTR6ZQaBS2oTeNJMYUywp47bBOYPaJfQD7c7Z0I4j/aFDHGXwIxP1xTGH9uqj4U
         m24ooQ/tQ785h47k3qSv0uBuLnTPkcXfjFNejgqv9dn3JfVJsDw4XyX1bHv+tZquOWdg
         MADLr4VMrRIdyKdzw8mVofTm9POEP9L4cDCPDlGHSPp53DvNF/KxEezQjpkkEwFs0n9Q
         TpWWBz5brG4uZeLre5/+z2M1ESTiGki0SNXsGVOsyGKCtqW25owCZjjUv7kpHt165hqN
         Pjy8+fti4YZkpNa017Aeldcof/zQJ6Af6iOGg2Abm+qWDemJKopGZj9JAHtHJYEplMhA
         UD6g==
X-Gm-Message-State: ACrzQf0MFGY/hv6xQDTLVmWeshjxqVKpcEzSu2eogxKJJefWI2oWewAV
	SeeYqjsniJXHhd8vLmtacwzS0xixI1Q=
X-Google-Smtp-Source: AMsMyM4efi5rDOqgB7+BhNgkboYefdkKZgct7HfWzfb+zL+hghWPILYQOJ6jI0CkOy/iUJ3RGfNNFg==
X-Received: by 2002:a05:620a:124f:b0:6cd:ef55:544c with SMTP id a15-20020a05620a124f00b006cdef55544cmr10873419qkl.158.1663534242119;
        Sun, 18 Sep 2022 13:50:42 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id q4-20020a37f704000000b006cbc6e1478csm10977065qkj.57.2022.09.18.13.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Sep 2022 13:50:41 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1] Broadcom drivers fixes for 6.0
Date: Sun, 18 Sep 2022 13:50:38 -0700
Message-Id: <20220918205038.3017866-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1085f5080647f0c9f357c270a537869191f7f2a1:

  soc: brcmstb: pm-arm: Fix refcount leak and __iomem leak bugs (2022-08-29 10:30:22 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.0/drivers-fixes-v2

for you to fetch changes up to 90d000288e115ca63452813c423f9dfd9f521c96:

  soc: bcm: brcmstb: biuctrl: Avoid double of_node_put() (2022-09-15 14:30:29 -0700)

----------------------------------------------------------------
This pull request contains Broadcom SoCs driver fixes for 6.0, please
pull the following:

- Florian fixes a double of_node_put() in the Broadcom STB Bus Interface
  Unit driver

----------------------------------------------------------------
Florian Fainelli (1):
      soc: bcm: brcmstb: biuctrl: Avoid double of_node_put()

 drivers/soc/bcm/brcmstb/biuctrl.c | 1 -
 1 file changed, 1 deletion(-)
