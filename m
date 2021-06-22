Return-Path: <SRS0=8XZc=LQ=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735BCC2B9F4
	for <soc@archiver.kernel.org>; Tue, 22 Jun 2021 13:05:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4E7826135F; Tue, 22 Jun 2021 13:05:00 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28B0B61040
	for <soc@kernel.org>; Tue, 22 Jun 2021 13:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28B0B61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=jens.wiklander@linaro.org
Received: by mail-lj1-f178.google.com with SMTP id d25so1956319lji.7
        for <soc@kernel.org>; Tue, 22 Jun 2021 06:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=jtJ/PpWosUWKo9N81UZmZyqeDEJHdOfHRjcctVezzbk=;
        b=eKzTIy26AtakD56NIBxhuUgcUiQTkUNTXyIzAWRUQm95eXokirCQKgb9dL334GREiv
         eAVqp2Gz3FB0fbdN9E5iw0JvZInbFplh2qmcQ45PiCcXfkcq/FL0vXOB1oY62wx9YfTg
         t+59CWR0Ac5ssBIMzVb3nZEHknMeyrxbAjDq3MyYhZ2ofy9AY0yT+7nIlxqgiEwYSQxI
         WHF+ImfF0IZ2dWDJ5TH5Tke9A6z/4vjAQJOpv53AM3cOqYlMyipg0O2gTcYrIUw2tb22
         B9izBM/yMCS/1br0A+ld2/S9/T9BNwBdEt/kJ/ftBEgO1kjM8AiIgWmAJI0WeeppZCqW
         07jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=jtJ/PpWosUWKo9N81UZmZyqeDEJHdOfHRjcctVezzbk=;
        b=cl0wKTgDYqK5HghDR1oLV62rwA96pLIaOglozPjAG5Xf4QGA20wlEhnZEwZ0+nuME9
         hzkJeaNpcbem+7Xeipb254/G9yJw0kzKOUVXjQnj/dgmtKKd600Pqqqx57pVHVdaSwm1
         M27Bu2R6UiNHuLJbI6MxA8F8qj8Mh3q1Meq2rVBsPE71t1XkvK+sLprCKnIDZCaiOxAC
         sttjcyPGstNHdy2yDkOEBmnmvkh2hKXgvcek84EBc16yg5GgPz59ArXBOQiPfQ5XE/bY
         zi0NDFrDeUO47Zdpe55pakiBrjp6LPc1n71x/K59VPsAQiyunqh/5uaeuTIPyoh4h2xp
         B1RA==
X-Gm-Message-State: AOAM532EEVF0DA75/lVKcszmgBI8684AApDFjob4uCS3G7kD3Wune+Ez
	AiI0sg48DNZBVocNx8W+H6/VQA==
X-Google-Smtp-Source: ABdhPJwqtjgiYlFpJtbIhAGYBnmYGr/K1P6uQeS1+VZflSi3wN/oQxXrINtgCULZAFXy5r8rRmyWjQ==
X-Received: by 2002:a2e:9e16:: with SMTP id e22mr3103960ljk.447.1624367097162;
        Tue, 22 Jun 2021 06:04:57 -0700 (PDT)
Received: from jade (h-79-136-85-3.A175.priv.bahnhof.se. [79.136.85.3])
        by smtp.gmail.com with ESMTPSA id j16sm2501090ljh.66.2021.06.22.06.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 06:04:56 -0700 (PDT)
Date: Tue, 22 Jun 2021 15:04:54 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: op-tee@lists.trustedfirmware.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [GIT PULL] TEE reviewer for v5.13
Message-ID: <20210622130454.GA2196996@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this patch which adds Sumit Garg as TEE subsystem reviewer.

Thanks,
Jens

The following changes since commit d07f6ca923ea0927a1024dfccafc5b53b61cfecc:

  Linux 5.13-rc2 (2021-05-16 15:27:44 -0700)

are available in the Git repository at:

  git://git.linaro.org:/people/jens.wiklander/linux-tee.git tags/tee-reviewer-for-v5.13

for you to fetch changes up to 9600948a2e919cabc18f196373e9f60c32bdb44e:

  MAINTAINERS: Add myself as TEE subsystem reviewer (2021-06-22 14:42:58 +0200)

----------------------------------------------------------------
Add Sumit Garg as TEE reviewer

----------------------------------------------------------------
Sumit Garg (1):
      MAINTAINERS: Add myself as TEE subsystem reviewer

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)
