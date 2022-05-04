Return-Path: <SRS0=o2FI=VM=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462BDC433EF
	for <soc@archiver.kernel.org>; Wed,  4 May 2022 20:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 09A61C385B1; Wed,  4 May 2022 20:18:08 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1798CC385A5
	for <soc@kernel.org>; Wed,  4 May 2022 20:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1798CC385A5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id y32so4239163lfa.6
        for <soc@kernel.org>; Wed, 04 May 2022 13:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=/7SaxbrAKYy5nHjPeP6rKPzhr5cf0KgWZreybqQSSK0=;
        b=vH4P23aRILvPjXrFTf+PKSY5WZyteRVwqCQxiYPHQY4SnjhV5kTiBoIIHwMT3N3nzb
         n2gTDORYJZ3lIchUKu2QKuDBYZUJnTjm2A0iQh9tjc2GjceqpKx0eQcnQakbOeVlNKcP
         gYJElSdyE2lUs0EWGrRj5xbNIF9UK5mf3InKhQglmy2HC3/q9dDKE2ud97fB7Xt09juG
         ZQDZ5a0zyxlT7/vD1CAnIHMa4iRN96ujdZ+vj0ymSR8YEEY/gW2UKHA618uUEQpZBdmh
         wvrW4Ol5LienogN5JX72UVxYyEm465NfTwzhPyAZY2cSwFPw9PpzHH82RlAB68cPXKx2
         l0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=/7SaxbrAKYy5nHjPeP6rKPzhr5cf0KgWZreybqQSSK0=;
        b=JPDKsgRc64c+IB/UDECEYil+MaD/DTLwzzEsys0HeHrUHT0rXRGzLZ9AwwoMfFzCgE
         AIYsK6xoH12yKCgPrzikOSduTTGA0WJezMxiI3lS/5F9RmHuqfcMq4+hyb8QJqCsA1P+
         Q8hcrPbGLucJ8WF/LdvBEpC8S0PV+M1YFbZ9tz67RKk+ivdaIno0OpgbSXIAMmfdceww
         1DjBSpDGxD/2f31Z0GtpkvX0jlhnb6JW8d01h8rhguYjCtnwbq0nWdSdPWJdAYMrgYFM
         Nv0gyAS8hwc0jdQBOODopsfawzqYeR0T07mxY69WHRl9LV5fQxsM3ncRUk/TijmaDBxz
         jGzw==
X-Gm-Message-State: AOAM530A/XuFa0vWn/DLwEGbwzgCKF5VGCZDfuUjk3tc/cJTVVl1H3Li
	w+40Sc1QO+GtwZCfhll8SMui9g==
X-Google-Smtp-Source: ABdhPJx7s9k+vQS15Ri0wixJykWHpgypG/aIMgqdCW4IpR8U7ii9SJNply59hEAHQaq76eBWTiLrqg==
X-Received: by 2002:a05:6512:10c2:b0:473:b559:2016 with SMTP id k2-20020a05651210c200b00473b5592016mr4584359lfg.641.1651695485120;
        Wed, 04 May 2022 13:18:05 -0700 (PDT)
Received: from jade (h-79-136-84-253.A175.priv.bahnhof.se. [79.136.84.253])
        by smtp.gmail.com with ESMTPSA id h18-20020a05651c159200b0025052e35be2sm1064541ljq.130.2022.05.04.13.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 13:18:02 -0700 (PDT)
Date: Wed, 4 May 2022 22:17:59 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE RPC arg for v5.19
Message-ID: <20220504201759.GA180315@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull these patches which improves performance when communicating
with OP-TEE in the secure world. A cache of argument structs is
implemented to minimize the number of alloc/free and possibly also
register/unregister of these buffers in the secure world. This boosts
the performance in particular in a FF-A configuration. It should also
save a bit of shared memory since each multiple a physical page now can
hold multiple argument structs, instead of one page per struct as it was
before.

The OP-TEE SMC ABI is also extended to pass an argument struct needed
for RPC together with the primary argument struct, in a manner similar
the OP-TEE FF-A ABI.

Thanks,
Jens

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-rpc-arg-for-v5.19

for you to fetch changes up to 5b4018b959149eb5b5f3004fc0339674af67516b:

  optee: cache argument shared memory structs (2022-04-25 21:13:05 +0200)

----------------------------------------------------------------
OP-TEE RPC argument cache

Adds caching of the OP-TEE argument structure used to pass request to
secure world. This reduces quite a bit of unnecessary alloc/free and
possibly switching back and forth to secure work in order to register
the buffers in some configurations, most notably FF-A.

----------------------------------------------------------------
Jens Wiklander (4):
      optee: rename rpc_arg_count to rpc_param_count
      optee: add OPTEE_SMC_CALL_WITH_RPC_ARG and OPTEE_SMC_CALL_WITH_REGD_ARG
      optee: add FF-A capability OPTEE_FFA_SEC_CAP_ARG_OFFSET
      optee: cache argument shared memory structs

 drivers/tee/optee/call.c          | 238 +++++++++++++++++++++++++++++++-------
 drivers/tee/optee/core.c          |   1 +
 drivers/tee/optee/ffa_abi.c       |  36 ++++--
 drivers/tee/optee/optee_ffa.h     |  12 +-
 drivers/tee/optee/optee_private.h |  31 ++++-
 drivers/tee/optee/optee_smc.h     |  48 +++++++-
 drivers/tee/optee/smc_abi.c       | 197 +++++++++++++++++++++++++------
 7 files changed, 461 insertions(+), 102 deletions(-)
