Return-Path: <SRS0=2q8B=S5=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456DCC433EF
	for <soc@archiver.kernel.org>; Mon, 14 Feb 2022 12:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1AF15C340F0; Mon, 14 Feb 2022 12:59:36 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76F28C340E9
	for <soc@kernel.org>; Mon, 14 Feb 2022 12:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 76F28C340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id e17so22120170ljk.5
        for <soc@kernel.org>; Mon, 14 Feb 2022 04:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=xE6oH1l8roCpLAC7Wz9reE1zFtexi58NOcCqLOgqq3I=;
        b=np/8FqqauGyYXpS75ffKq7DnlBqSgyv6Z+qbrdayhleRze/+Teqynbg4tyfYET+VJ6
         hN7l57X5dfB1NnF3x3SwVYlHesuy7QfcmSUfARJzpCn5eLv3QLuFI8XdHTeLBOclct69
         5y7h6gaqmIxp5jKdqklm0zWELoxps8chOU1Zdy4cE2w12Vvx8hJTBfn7/B/wE5kAy+7x
         xUdgWo651H6Aor614PAn3C1VAIFBOhewXdErz3Yd1t915KyMtcJob9YwiEporQ2rv/+D
         xRXH/q7U+qFDl8JrRG3MZ/3p1Mg+HI1U32mjHSp6xXdw9Aor2u0pwrIuQpHqvOiCUnPE
         FlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=xE6oH1l8roCpLAC7Wz9reE1zFtexi58NOcCqLOgqq3I=;
        b=rThQ6OjNWa6YEcM0b5QtQ1lBmGDEfKh0fGMPu+QD8Yi9E5rW8geMi37tUbOidiOJkh
         x2AXXM7KYHPmo8YPHpvqsB7A6x/J51umxdgBQcoZ0lZqqJCMPHa4Ky3sCu8v9cSA1HMd
         Y5r+zatCyRIZZfUElE9B6pmnTu3+pNRCdsNt1NxSy5kaPDw6Sy+leMmv4GvVb9zY0ZcP
         yxCfr3PQQwVIJTci8qpWCiqbAHe0pr/SZstUrDFQ5vc2/dvdqZdKqsiqB37/dRvj1sQ1
         gq6C5Igqb3PfNTvOEQe09YU27nvk+vumIsnbqpgjM0dRuBIqRZQUzMpCZmXOpf/8NwIZ
         j+Fg==
X-Gm-Message-State: AOAM532/yBtggLqpiNVgE97OCBrOfP+Wdk3BK/Yncv9ZC62KsXPmYpwd
	5Ht36uPcpjO8AwxyawpiYiS8Yw==
X-Google-Smtp-Source: ABdhPJyl8EivjpsERn9JHrhdBXPMO3sde1+2Kx4h1aGZFLECQffjXhIaxa3O6uuBvpj4wUU/spjd2w==
X-Received: by 2002:a2e:a594:: with SMTP id m20mr8762680ljp.491.1644843573562;
        Mon, 14 Feb 2022 04:59:33 -0800 (PST)
Received: from jade (h-94-254-48-165.A175.priv.bahnhof.se. [94.254.48.165])
        by smtp.gmail.com with ESMTPSA id v26sm446752lfo.178.2022.02.14.04.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 04:59:33 -0800 (PST)
Date: Mon, 14 Feb 2022 13:59:31 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org,
	Yang Yingliang <yangyingliang@huawei.com>, sumit.garg@linaro.org
Subject: [GIT PULL] OP-TEE another fix for v5.17
Message-ID: <20220214125931.GA1332792@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small OP-TEE driver fix taking care of a broken return
code in the error path of the two probe functions in the OP-TEE driver.

Please note that this pull request is on top of the previously just merged
patch which introduced the problem fixed here.

Thanks,
Jens

The following changes since commit aceeafefff736057e8f93f19bbfbef26abd94604:

  optee: use driver internal tee_context for some rpc (2022-02-03 13:36:32 +0100)

are available in the Git repository at:

  git://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-fix2-for-v5.17

for you to fetch changes up to 40eb0dcf4114cbfff4d207890fa5a19e82da9fdc:

  tee: optee: fix error return code in probe function (2022-02-14 12:36:48 +0100)

----------------------------------------------------------------
OP-TEE fix error return code in probe functions

----------------------------------------------------------------
Yang Yingliang (1):
      tee: optee: fix error return code in probe function

 drivers/tee/optee/ffa_abi.c | 4 +++-
 drivers/tee/optee/smc_abi.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)
