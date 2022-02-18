Return-Path: <SRS0=9k4A=TB=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FD4C433EF
	for <soc@archiver.kernel.org>; Fri, 18 Feb 2022 17:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD9BEC340EF; Fri, 18 Feb 2022 17:56:37 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 422F3C340E9
	for <soc@kernel.org>; Fri, 18 Feb 2022 17:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 422F3C340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id bx31so5528850ljb.0
        for <soc@kernel.org>; Fri, 18 Feb 2022 09:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=/4HrUgYlNj6NJRogd/KPSeqtVQ6+jaJ4N7YhgxWLksc=;
        b=Fb8rOUmirBXLpLWlunWMkI3j848IAbT9mkZyCA4v4kAoIn8BNEmJ4MvL2tsWauxvyt
         l8itxOTUVvOEE77Gy+YvzKbOZiHFPaL/HotivYcbsOHwwOuWkazagUFnNi1NJ3abRFxr
         08hL+DyjdNkFpKVv8jmndf1AuaJ4lskQmsNgdroRYdPzEnwBtkN3co3FJzFo1Khjvr69
         VWX5ZfBKS42CaHbGV34VO9FeHzh5fA90JtshQNLgaTGr5KdOkny7bO8EzLvxmtLyxWrR
         jzE69ftIHyqftRRLLLTAJiVSb5Et+l+qAVuY8WcW+8UNpjJLx1Yk5ee3cxU4LOmR2dkg
         EOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=/4HrUgYlNj6NJRogd/KPSeqtVQ6+jaJ4N7YhgxWLksc=;
        b=iG0GFzeE79W5vlOy3bChUz5hGEYQp0kAQoNuO/EWCDT/SwkC2Gs7wnW1sgAEatn+2N
         l+T7kChLon2ycL8hWnnBDz6Q46XIa0H+chcnzY0COVzOJ5fvQkXI5NLHyBpvVNv6oWMZ
         x+iskMmbWeaLen1+kLYBympGKBYIrcEo02FCW5diHJyeeVr1eAKuOg+anh4+vI2W44Zd
         kQBERcnaM+V8gXfOsNy8wwnLe678EQp62fC19LnYOr9vL2uKFf2oQGjlJFReY15kUWgB
         mbRprU8Zo+cEeREQqpTvuO3TcPbugFV9rYroDxfSleMj8+f0rsKyPeo4LnkQXKkHgqwX
         VdaQ==
X-Gm-Message-State: AOAM532LI02VXCfKR2kXp6LDaDz+WsNJimMKWU7B3NjybMZ8aRuJH64s
	o8paLeuEhQXC7oEwtp3VQFN9uQ==
X-Google-Smtp-Source: ABdhPJyLRo+IPJKJK5ltw12JckpLRaqYNiOrh1988ArjU1mdO+2843jJEwaZY3lKoE6FB5oadWg4jQ==
X-Received: by 2002:a2e:871a:0:b0:246:ee2:1109 with SMTP id m26-20020a2e871a000000b002460ee21109mr6399697lji.165.1645206995032;
        Fri, 18 Feb 2022 09:56:35 -0800 (PST)
Received: from jade (h-94-254-48-165.A175.priv.bahnhof.se. [94.254.48.165])
        by smtp.gmail.com with ESMTPSA id z26sm386410lja.139.2022.02.18.09.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 09:56:34 -0800 (PST)
Date: Fri, 18 Feb 2022 18:56:32 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Rijo Thomas <Rijo-john.Thomas@amd.com>
Subject: [GIT PULL] AMDTEE simplification for v5.18
Message-ID: <20220218175632.GA926082@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small AMDTEE driver simplification to use the LIST_HEAD()
macro instead for a global variable.

Note that this isn't a usual Arm driver update. This targets AMD instead,
but is part of the TEE subsystem.

Thanks,
Jens

The following changes since commit 26291c54e111ff6ba87a164d85d4a4e134b7315c:

  Linux 5.17-rc2 (2022-01-30 15:37:07 +0200)

are available in the Git repository at:

  git://git.linaro.org:/people/jens.wiklander/linux-tee.git tags/amdtee-for-v5.18

for you to fetch changes up to f7b67642dd98617dc569836cdcba041c7ff00cbb:

  tee: amdtee: Make use of the helper macro LIST_HEAD() (2022-02-14 10:57:55 +0100)

----------------------------------------------------------------
Small simplification in AMDTE driver

----------------------------------------------------------------
Cai Huoqing (1):
      tee: amdtee: Make use of the helper macro LIST_HEAD()

 drivers/tee/amdtee/call.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
