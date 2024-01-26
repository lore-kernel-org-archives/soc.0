Return-Path: <SRS0=MX4Q=JE=gmail.com=unicornxw@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16704C47DDB
	for <soc@archiver.kernel.org>; Fri, 26 Jan 2024 09:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D31AAC433C7; Fri, 26 Jan 2024 09:19:51 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 00EA1C43390;
	Fri, 26 Jan 2024 09:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 00EA1C43390
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-214de82b6ddso95663fac.3;
        Fri, 26 Jan 2024 01:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706260790; x=1706865590; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J49bMlLhf05kk4FSUGnjaiEjqAJComLQo//Z+1eeQ7o=;
        b=hMKdq+KA7kcTJQ3FMY5WOOeo/0HpSzPbyZqTr4s/tsRo4IXP1TIUM+BuAXJDxCP/D5
         gTvCb+ANqZzBVDuTJ+vjTOva7CLKp9/i9C180qledAi1tnBox1lFk7ElLxBVF8NMNEtQ
         sfy8I36P5bBvGtE4ELlTws0QqZ5z2eRHbM5bAHdvtMr/hhM9zuBE+Oc9arKMb7NvFQEg
         hrIINVpu2bw+2p4waPQqxrm/dXpjDnsNQxaiT0cYyHgESTlrOr6wgElmIaPPJ8q9ZQPd
         HePYKOyZF41psIi1W+tB211SvRdH2rRqhe0id3uOKSMBSkl6nMQ7xQDW0arbskCwfo5a
         RE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706260790; x=1706865590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J49bMlLhf05kk4FSUGnjaiEjqAJComLQo//Z+1eeQ7o=;
        b=LGtx4FIR1ch9gQoe6MTTkt/QLYjN/k6k+mXB3KrBdMxBPoAFpUj4wwP4WTdLM/WA47
         9mCaz/t0juyH6ivZIrHhPCYGrIFZhZ43liGSGRyRCZJEji3d1Ts8wgfBA4fJJlIy++2N
         FBDSjcqzot5d5TANi5DmHrBTMMp225QB9miWnFFDg0mOw0GhQdbmZBQENEcB675Tf7gN
         fI8bOBYQgrp7qUC+cVl/AfXCVGOxgFn4jiH2O/1UiPmGIMt2bz99ppzPTSoHONIn0OUt
         mqks1HS55ZvZ7BgibdpNhWHX7daiu2h+mVPvr332x25iW8S5ycwCAAS8RYSZFD4nSZWR
         wkvw==
X-Gm-Message-State: AOJu0YyPeG7crhQ4ifSSAv/VUiu4KkBMghp67wusnaUnghB5q2N+cw8y
	bGoPMH2u8YUEiGfrjo5hkqtDXcjsKxNYo0YNt557VMFYBLx5giviCBOZabvm
X-Google-Smtp-Source: AGHT+IELGpjyvmeeTrl8i+5bEFhubb0M6Wfzg6gEcbtJvuHErN807mdU53478urbw00rNkSd1xE7uA==
X-Received: by 2002:a05:6870:55ce:b0:206:86ef:7b40 with SMTP id qk14-20020a05687055ce00b0020686ef7b40mr1101554oac.109.1706260789533;
        Fri, 26 Jan 2024 01:19:49 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id pl10-20020a0568704e0a00b0021837cadf53sm69258oab.39.2024.01.26.01.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 01:19:49 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org,
	palmer@dabbelt.com,
	linux-riscv@lists.infradead.org,
	inochiama@outlook.com,
	xiaoguang.xing@sophgo.com,
	haijiao.liu@sophgo.com,
	chao.wei@sophgo.com,
	unicorn_wang@outlook.com
Subject: [PATCH 0/1] RISC-V Devicetrees fix for Sophgo/SG2042 v6.8-rc1
Date: Fri, 26 Jan 2024 17:19:41 +0800
Message-Id: <cover.1706259884.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

Hey Arnd,

Please pull one DT fix for Sophgo SG2042 based off v6.8-rc1. 

Thanks,
Chen

---

This patch is [2/2] of [1]. The binding part [2] has been merged in v6.8-rc1, but
the dt patch [3] is missed. This fix add the dt patch.

Link: https://lore.kernel.org/all/IA1PR20MB4953C912FC58C0D248976564BB86A@IA1PR20MB4953.namprd20.prod.outlook.com/ [1]
Link: https://lore.kernel.org/all/09b2fc2f-dde9-4f43-9704-d8053bfc85cf@linaro.org/ [2]
Link: https://lore.kernel.org/all/IA1PR20MB4953669C097D9C9E24B549FFBB86A@IA1PR20MB4953.namprd20.prod.outlook.com/ [3]

---

Inochi Amaoto (1):
  riscv: dts: sophgo: separate sg2042 mtime and mtimecmp to fit aclint
    format

 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 80 +++++++++++++++-----------
 1 file changed, 48 insertions(+), 32 deletions(-)


base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
-- 
2.25.1

