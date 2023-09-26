Return-Path: <SRS0=B15I=FK=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F31E7E620
	for <soc@archiver.kernel.org>; Tue, 26 Sep 2023 11:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 92F79C433C8; Tue, 26 Sep 2023 11:21:42 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DBD35C433C7
	for <soc@kernel.org>; Tue, 26 Sep 2023 11:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DBD35C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-532c3b4b55eso10078891a12.0
        for <soc@kernel.org>; Tue, 26 Sep 2023 04:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1695727299; x=1696332099; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=velEPa15a6V5qxZqYe4DRtNPkFgAlNerUIAKT94vu48=;
        b=IEmW9yze99MYcCA4xL9QyIGhtw73ocKqTYZkGyS0192FAR5EgTzvWJ85i7VSLWLIYU
         dTg2ohrVSMoQQWsgpGWFProJZyEVGCGzeOtZvjUMDVeiDpGgnwonLqz67CC5yrClpFMY
         MH+nh4PyV0oZfti+TS1yPhX9hGiIKlAOQ8RPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695727299; x=1696332099;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=velEPa15a6V5qxZqYe4DRtNPkFgAlNerUIAKT94vu48=;
        b=vw8Dn2/Bc6XavgBETyRgR5Kkl+0JcLpTn3fY8Dp4fNvQ1d7DdookK9/5dTFuEu8la9
         g1mD3O35JAhRxc1NTZImO2o/ifs4/MBLKCxeuKZWGvsx8k173FHRpGl5rMtZJ+tfxRJj
         +WLDqcYJvsElKZcHKZ+X5/983Mry2xCrbTS9WsJYKbWTAb0B7T9CUdGN51OBOuFUoOtS
         MA7l3Xk2s8ngyLQA5wj1+p36Pn4SQNmCAjSnYnNGKrBnH5wQjzyJlvWF6JUKs37QnvTs
         UDqRJXASd4bxW/OQDycVyMktFKLZE284cWn3ZD79/rM6WcSEkzgl7ypobADnlOAonuUV
         eV2A==
X-Gm-Message-State: AOJu0Yyl6MG8pHaBJdpYFbnNwjjerlnGtfIicQgn1Teo2zbcApt2hbHr
	gXJQYuElnRYLADbIQa6CCybZu+cEoXkjUddS2K4hAYbWL28=
X-Google-Smtp-Source: AGHT+IHf04Y12PQ3jiFRSvSSitMQKGKrXR7FN+WSgnCNVjLwYyPQF45jBzRYdA3vdUKHzK2yeT2+FNJ9sYG06oto/sQ=
X-Received: by 2002:a17:906:8467:b0:9b2:6ce3:bdf3 with SMTP id
 hx7-20020a170906846700b009b26ce3bdf3mr7535160ejc.54.1695727298793; Tue, 26
 Sep 2023 04:21:38 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 26 Sep 2023 11:21:27 +0000
Message-ID: <CACPK8Xc+D=YBc2Dhk-6-gOuvKN0xGgZYNop6oJVa=VNgaEYOHw@mail.gmail.com>
Subject: [GIT PULL] aspeed: Maintainers updates for v6.6
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Zev Weiss <zev@bewilderbeest.net>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

Can we get these merged for 6.6? It's not critical, but best to have
the correct information in place sooner rather than later.

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-6.6-maintainers

for you to fetch changes up to 9c888dbf2164e320e63f3ebfd85a99486bee9c3a:

  MAINTAINERS: aspeed: Update Andrew's email address (2023-09-26 20:43:49 +0930)

----------------------------------------------------------------
ASPEED Maintainers update

Andrew has changed addresses and the git tree has long since been at a
different location.

----------------------------------------------------------------
Andrew Jeffery (1):
      MAINTAINERS: aspeed: Update Andrew's email address

Zev Weiss (1):
      MAINTAINERS: aspeed: Update git tree URL

 MAINTAINERS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
