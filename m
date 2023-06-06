Return-Path: <SRS0=eGOd=B2=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BDDC77B7A
	for <soc@archiver.kernel.org>; Tue,  6 Jun 2023 07:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 66C53C4339B; Tue,  6 Jun 2023 07:58:48 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 65283C433EF
	for <soc@kernel.org>; Tue,  6 Jun 2023 07:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 65283C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b1af9ef7a9so51248151fa.1
        for <soc@kernel.org>; Tue, 06 Jun 2023 00:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686038325; x=1688630325;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3k1irXTYukr99PsFNAkymM0Og80zDNstPLsK0k6o+Jk=;
        b=rL2FG1uuVGUyrvNG3McMCmB4ydldmGc4bEMB0o2gg28bdxcdSbAjvXkldJ3xX7uK2n
         bTd41UrD8iNypclzCFRPQsu8PCtmWvpl7VLnzzhB/aQ6699H39Hs+PmqLEo8v0qC2ydL
         LKW5YZLrUHqSBRQKHi5dTc/OL32bnnid33luzOvZrIKNilTeH8gNjpw2X5/8P/g96IcD
         QJ7rB/AH5QPjuUZQTl8bRVFad77eG/izX1PAqJqjBc1mBkQCec5Qfcy5NMJFTQzOtoAI
         agYrWXEflFntXYEvhY/iXFy0Oo/ZxcO1qcXX5AQ5t7SENQ1O2GQCwxX3446a7UWD/Q1F
         3rmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686038325; x=1688630325;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3k1irXTYukr99PsFNAkymM0Og80zDNstPLsK0k6o+Jk=;
        b=ftWKA4D5sycNtKWcngWUx8SiPDEM3cKA7WY3M+TUMWVDfkiKD+84hU1gaavRpdk+KU
         XyQY+F/TWWnnmAaOd15hU0TF27B+HlzpkJfpG7sIxfRhfm84+NclAatsx1fbwgPXjAt3
         kkU82Umn0Mhc6XMEIMaOwwqqOJSJkKfZTzWk/EoI2Q6r/Teo/tA/arIbqeJq+XA3IQA0
         JzoGS4/wexdIYmycnGFqCy7xQ4xM3muI/Ci5YUPQj65r0TmlUgQOQ+YaMdTo62/un78t
         2HuYFbmRbBxUX3PrYryWGGOrDKla8fISCixqlyeVP8NvhMgPgRy5CSz9Rs52W7IpbNH1
         IZMQ==
X-Gm-Message-State: AC+VfDxmNG9XHOPVvoJVQw5bjS4QQ4aLj5PzqMTtb+WhFveK80k+8IUh
	5EklGwVnV4dqLhi73S/ABoxr8w==
X-Google-Smtp-Source: ACHHUZ518pQSHi1ktn+stGaMfzxkmsSSqAI6RmGocuetkundaUI/8yvnmw/gM4JX4uZKtIWhFzvJmA==
X-Received: by 2002:a2e:8010:0:b0:2b1:ae75:2781 with SMTP id j16-20020a2e8010000000b002b1ae752781mr867582ljg.27.1686038325151;
        Tue, 06 Jun 2023 00:58:45 -0700 (PDT)
Received: from rayden (h-46-59-78-111.A175.priv.bahnhof.se. [46.59.78.111])
        by smtp.gmail.com with ESMTPSA id a4-20020a05651c010400b002a8bc9918d4sm1736574ljb.97.2023.06.06.00.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 00:58:44 -0700 (PDT)
Date: Tue, 6 Jun 2023 09:58:43 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] AMDTEE fix for v6.5
Message-ID: <20230606075843.GA2792442@rayden>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this AMDTEE driver fix to add a return origin field to the
struct tee_cmd_load_ta used when loading a Trusted Application into the
AMDTEE. This change is backward compatible.

Note that this isn't a usual Arm driver update. This targets AMD instead,
but is part of the TEE subsystem.

Thanks,
Jens

The following changes since commit f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6:

  Linux 6.4-rc2 (2023-05-14 12:51:40 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git tags/amdtee-fix-for-v6.5

for you to fetch changes up to 436eeae0411acdfc54521ddea80ee76d4ae8a7ea:

  tee: amdtee: Add return_origin to 'struct tee_cmd_load_ta' (2023-05-15 08:29:52 +0200)

----------------------------------------------------------------
AMDTEE add return origin to load TA command

----------------------------------------------------------------
Rijo Thomas (1):
      tee: amdtee: Add return_origin to 'struct tee_cmd_load_ta'

 drivers/tee/amdtee/amdtee_if.h | 10 ++++++----
 drivers/tee/amdtee/call.c      | 30 +++++++++++++++++-------------
 2 files changed, 23 insertions(+), 17 deletions(-)
