Return-Path: <SRS0=YgfF=FD=gmail.com=twoerner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF7FCD5BAD
	for <soc@archiver.kernel.org>; Tue, 19 Sep 2023 12:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 66F40C433C7; Tue, 19 Sep 2023 12:51:17 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 93765C433C8
	for <soc@kernel.org>; Tue, 19 Sep 2023 12:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 93765C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-76dbe263c68so250831385a.0
        for <soc@kernel.org>; Tue, 19 Sep 2023 05:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695127875; x=1695732675; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EzfxQdXla0PknaJGcF18mFftRNpFMZC6735h+HuTWrQ=;
        b=GvSMfahtVLWUbVmOCpVngCMGYklZA4ETOoXVfH7uIoQ659JGVo5BmXHPRdAga6bg0o
         8oiS/s6aksMm4xXlADhxKI0cWB73t8AoGMwZ5r3GB0X7lv5hbTwhEcoJ8tg6+7PZOv56
         vIr1nuJycFzysmlJf1DPREAGL41IYbijTjqWfUcJKPVuS4Fxcq+50CYmVkHn2HM67gq/
         sz254uiX/62VX+6YxCy1F5JSd9tlVzNebWV48QWLykZHAqGHKhk6pedz12r0UCtZ4m0E
         0qtx3PX98EYa6RKY53N4kJ7wJAAbd8LntHccqj5cRDOKv/cF4FGypYMthVe2So9utfC2
         qYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695127875; x=1695732675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EzfxQdXla0PknaJGcF18mFftRNpFMZC6735h+HuTWrQ=;
        b=OKzDXdUzRKoCCqQzQV0PxzKQD75/T//7H2eIdj3mJ96ITOGfAx2ZX99+86rhM07dMv
         iTI33ePYZ+sxdig2OUZ1fANuAkqlrFnX7DbiVbfKvbOWDWHO/qGgljjWOlWt+29Kt+v/
         cNjldo2PjkMTXH/Z8t5A32gINha0Kysxoh4FnSAqDV66ViggfoTf+Sj+ZnMaXGsmRMGv
         30fk0cmaNM2jpg1AhFrudOK0hvNwdx4/cgNJMMAUUMX1wzFG108mH31edwmXcAPU9TvV
         xMAEewFPxnzs1tof5esef/Rsh1YeTqORqaqxUuZ3rcaqEZRYoksIJteFSXeoD+M+aLdg
         YuZQ==
X-Gm-Message-State: AOJu0Yw49gMvdgj+K0aLO4ZQ3MXJLKwgf8rXMkwMLy06qxneBEMgPR5v
	8YPnNYEiA+aQ/FEyWlTQDYhqV+EntiMH9w==
X-Google-Smtp-Source: AGHT+IFyJyG0RDrT5otqhjeWZBTvAR7xF8M/r8Qpg65I95NA2PM08v0gr7EZLAAA0r6G7ybyMhT20w==
X-Received: by 2002:a05:620a:46a9:b0:76e:e66c:92f8 with SMTP id bq41-20020a05620a46a900b0076ee66c92f8mr3259115qkb.8.1695127875288;
        Tue, 19 Sep 2023 05:51:15 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id y7-20020a37e307000000b007676f3859fasm3936508qki.30.2023.09.19.05.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 05:51:14 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/1] ARM: defconfig: cleanup orphaned CONFIGs
Date: Tue, 19 Sep 2023 08:51:10 -0400
Message-ID: <20230919125112.15515-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.41.0.327.gaa9166bcc0ba
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop CONFIG_ options from defconfigs whose code has been removed.

v4:
Re-submit the ARM patch (alone) with a better subject line and CC'ing the
correct people to help ensure it gets picked up. v4 drops the patches for
mips, powerpc, and loongarch which have already been applied.

v3:
While reorganizing the patches, I put the wrong commit message with the
CONFIG_IP_NF_TARGET_CLUSTERIP option.

v2:
Generate arch-specific patches. In v1 I organized the patches by
CONFIG_ option which caused some of the patches to cross architectural
lines. This requires cross-arch consensus before they can be applied.
Therefore organize the changes by architecture so each one can apply them
independently (or not).

Trevor Woerner (1):
  ARM: defconfig: cleanup orphaned CONFIGs

 arch/arm/configs/keystone_defconfig  | 1 -
 arch/arm/configs/multi_v7_defconfig  | 1 -
 arch/arm/configs/omap2plus_defconfig | 8 --------
 3 files changed, 10 deletions(-)

-- 
2.41.0.327.gaa9166bcc0ba

