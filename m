Return-Path: <SRS0=rCKB=PG=gmail.com=romain.perier@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809E8C433F5
	for <soc@archiver.kernel.org>; Mon, 18 Oct 2021 09:59:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5853960F8F; Mon, 18 Oct 2021 09:59:09 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EF0C60F57;
	Mon, 18 Oct 2021 09:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2EF0C60F57
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id r7so40303741wrc.10;
        Mon, 18 Oct 2021 02:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ez9mbYG7dlgdhn9DND4IOScLuOYSIdJep7VgoVti+SU=;
        b=B9l2H+QZhkUorTGtrqoWbmg9pHgLN6o/lwXWs6RUWrV2WxlyyBHxmgdlaKNxqmG2sq
         ni+bGosqtScoJ3G4HKplSeIgvQbvTCj/VI9lTVPmsXXWulQUg8B2TcwLfPhZYBoo9mK/
         lOjIUCVGbtvAKHgDs+2OhcnVhFl9w2uUt9auHdT02PK/2grYM/LHXpAS/3XEiME+4Kpe
         6wZdXvFwaqzLJGKzOUFrQaLRe4kiQU9bAYL9fxXHQCzjiMyS1hiLifhI0E4Bnmv3lopN
         Kd68rVhmGP5VHutG5XA26eyDXPx8YE5WoB3eq0mug1s0pH9mkbW/3hNFQ39H/AUElxtR
         LJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ez9mbYG7dlgdhn9DND4IOScLuOYSIdJep7VgoVti+SU=;
        b=P+Gkf8nTt+t9yF2uqLqqM60zxO1QPRwukl0iSJaKIlQnllWV/XA9xnQMQ/BkcLl0OW
         T5us6BKBDv+WtZex6pKewtbo+g3/fjIc90nSsAmFxV3voAS/h7uMDFRuMHv4XsZXU7wd
         GsbCm/QzOfKoUbKG0YIScuwCXrl05EZQQ/aq9w08ljf33OLbKtNqEjJMr3yqw0qfeHf2
         7aT8+jVm9GJAAVKOCLrAduCHybbDC+upJHm+6na02IW3DoiKpqf6kfMT4bw5Luv+AdqS
         F6IgiBlVRw9SCk1ch0KoFvYQUtzHKd2VId0z2uT/d0wfE/I5we2Q1Gkk36iUHbcT6nkN
         JCqQ==
X-Gm-Message-State: AOAM532NE8yPdIEnGsyIsJnaWqIsoB4SJl2zRRpEtWDnCtTfFXuoAo6/
	kRcVfWmYSPK/amDyVPGayLKXq7/ejbk=
X-Google-Smtp-Source: ABdhPJwDo6uDJUvqKMwObGEwGoRekkvSL6t9p/QE07mSMIF3yjAZd0SCynhMTMhOAjbORzhY9ITBPQ==
X-Received: by 2002:a5d:598a:: with SMTP id n10mr33842460wri.93.1634551147675;
        Mon, 18 Oct 2021 02:59:07 -0700 (PDT)
Received: from debby (234.ip-51-91-57.eu. [51.91.57.234])
        by smtp.gmail.com with ESMTPSA id g33sm11047177wmp.45.2021.10.18.02.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 02:59:07 -0700 (PDT)
From: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Daniel Palmer <daniel@0x0f.com>,
	Romain Perier <romain.perier@gmail.com>
Subject: [GIT PULL] ARM: dts: mstar: updates for v5.16
Date: Mon, 18 Oct 2021 11:58:48 +0200
Message-Id: <20211018095848.19101-1-romain.perier@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,
Here's the ARM DTS changes for v5.16:
 - mstar-v7: Mark the arch timer as not being initialized by the firmware
   and rely on the physical timers.
 - mstar-v7: enable rtc

Regards,
Romain

The following changes since commit 64570fbc14f8d7cb3fe3995f20e26bc25ce4b2cc:

  Linux 5.15-rc5 (2021-10-10 17:01:59 -0700)

are available in the Git repository at:

  https://github.com/linux-chenxing/linux.git mstar-dt-next

for you to fetch changes up to 7e626b6d71e7678e85e9e06e9e2271b5923741fd:

  ARM: dts: mstar: Mark timer with arm,cpu-registers-not-fw-configured (2021-10-13 18:53:48 +0200)

----------------------------------------------------------------
Romain Perier (2):
      ARM: dts: mstar: Add rtc device node
      ARM: dts: mstar: Mark timer with arm,cpu-registers-not-fw-configured

 arch/arm/boot/dts/mstar-v7.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)
