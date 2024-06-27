Return-Path: <SRS0=+Zca=N5=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC49FC2BD09
	for <soc@archiver.kernel.org>; Thu, 27 Jun 2024 09:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 62ACAC4AF07; Thu, 27 Jun 2024 09:53:30 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63683C2BBFC
	for <soc@kernel.org>; Thu, 27 Jun 2024 09:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 63683C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a6fe61793e2so350063966b.0
        for <soc@kernel.org>; Thu, 27 Jun 2024 02:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719482008; x=1720086808; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UbOt547hAIIlJlatetFlVG+c0+VndBbbd6B/YWLqHxY=;
        b=LU5uZbGgqh7sLfRG1Xm6xDg2OrwYOGBmDCgnUaNOmSE6cgTNLxrZyaMBWUJdmnJpJD
         L4Bh8rkbvtD1TIadbh8dNkjlAL4DaruuF7rubgXNDmni8swHLcPZWtP2SIRphhsss5RG
         Z+ixOe5MhylY8dk9KPY3VO40dLNaI3mlWPi3uC/m4k/PUNT0Fjwg+oO8cRJLIMOgBDTa
         0mGyJZ1R/G9Hfb9dglAMgPaK4rLGydzUKbF2N19By+s2pMyRbUxl0p3CYk0ic2gejWo1
         LXAKTAXB5+1yZ4qg22t51nwxFvm6CaKp3+LjrIWserFaEStejIhioX2a4CdCPto/koEF
         W7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719482008; x=1720086808;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UbOt547hAIIlJlatetFlVG+c0+VndBbbd6B/YWLqHxY=;
        b=a3hHbbuSfolc+RUyrxvMdw8gQ4hmaobb57cr6do67TvbIiMVQkP0fQOPQYM35OCoqk
         HS8yA9qZFlQPJ6/X7Uxm2Q8E6DIkfJumzYUDzokdR2vQKXFl0HVXqLHu3XekNsQYL3bk
         Rgauwg/kG4lW0FZL4wWng+L5WtBsiqSJusBpljzS8XTPxcpQOIS0y99kLPu9XNYsJ0S5
         Z+PJoQedbdKjUUre87TrfK8/edJC822dly96FBYm9exCeN66OSojE3LFE2V5BJN3IlLg
         N1zJaUJ/ahhN7Vo8MLPx9k7ZOrS5JX4PpOIEByzujQ9Co46eou/asE9JqZVf1IelH+CM
         az1A==
X-Forwarded-Encrypted: i=1; AJvYcCU1ikCclAqXc3/+rPqEhZ0lRAXA4cJ7QhmU8CHerSP6kUck5eW5IjdfqPFIHsEdQe7kPAwlN2e+gD4ktQQ7Tw==
X-Gm-Message-State: AOJu0YzZH5xLFbxNuINjvghwPAb5Bmypb2i+7Xl1dVsRv6qe59QBdnaL
	k7G5Ue8lGthrCh0yETW4WV/isvPfgIxdquEsecdW8HWFhgTMGmAQ5ny+w9HA13w=
X-Google-Smtp-Source: AGHT+IGIuuOsJS5XWtZr85fjChr/P2HzFwqvfLFgwoJ4jn/hrtHNWGJXklJFb9Xc7x1BlOEXMt2WqA==
X-Received: by 2002:a50:9fae:0:b0:57c:b810:1062 with SMTP id 4fb4d7f45d1cf-57d4bd746e6mr11563671a12.13.1719482007771;
        Thu, 27 Jun 2024 02:53:27 -0700 (PDT)
Received: from rayden (h-217-31-164-171.A175.priv.bahnhof.se. [217.31.164.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-584d16bbf1csm649779a12.44.2024.06.27.02.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 02:53:27 -0700 (PDT)
Date: Thu, 27 Jun 2024 11:53:25 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE add notif wait timeout parameter for v6.11
Message-ID: <20240627095325.GA2585076@rayden>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small patch to the OP-TEE driver that adds a timemout
parameter when OP-TEE is waiting for a notification via RPC.

Thanks,
Jens

The following changes since commit a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6:

  Linux 6.9 (2024-05-12 14:12:29 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git/ tags/optee-notif-wait-timeout-for-v6.11

for you to fetch changes up to 14ca6401d8703725c7297dcc4bf8de73323411ac:

  optee: add timeout value to optee_notif_wait() to support timeout (2024-05-30 10:19:28 +0200)

----------------------------------------------------------------
optee: add timeout parameter for notification wait

----------------------------------------------------------------
Gavin Liu (1):
      optee: add timeout value to optee_notif_wait() to support timeout

 drivers/tee/optee/notif.c         |  9 +++++++--
 drivers/tee/optee/optee_private.h |  5 ++++-
 drivers/tee/optee/optee_rpc_cmd.h |  1 +
 drivers/tee/optee/rpc.c           | 10 ++++++++--
 4 files changed, 20 insertions(+), 5 deletions(-)
