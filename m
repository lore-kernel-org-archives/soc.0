Return-Path: <SRS0=8Y9D=F6=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43765CDB47E
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 01:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 28C41C433C9; Mon, 16 Oct 2023 01:49:35 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5C1B7C433C7
	for <soc@kernel.org>; Mon, 16 Oct 2023 01:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5C1B7C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9c2a0725825so110248466b.2
        for <soc@kernel.org>; Sun, 15 Oct 2023 18:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1697420972; x=1698025772; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AygaYDzdNsfUrtMjI8jfJpMH6DIvJve2ndUz4ktc4vg=;
        b=doX478aDQ5K7KFmTTYpuGvEWxMZpfEy4VD2kRH5MtHwgrWKPuarXUtoOsfjDa+Hez6
         J9a2BBN6KUEWAPiv+rMRm5cGSxQtCn1PiyqtsIZxiKxNATrCaUDbCE+dclsSthKJJNhw
         N2h3aFwscI5FWLyoA6VUE5LiXyIiFAGShNiug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697420972; x=1698025772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AygaYDzdNsfUrtMjI8jfJpMH6DIvJve2ndUz4ktc4vg=;
        b=vKv9tTNyy71tesrjM5qjqMci2/pfHDWdWC0FjVxJ0Dwah/YNARgQIQ8JWgnXRT4vmV
         n7VACttWWFj4JsYVKq4fM9yll6raqZvbz2yhU2ze/a1SXwMz7gWH4MP3M9YTYJvpO35M
         2SNRpc4kSqyMgjlYZ81olKelhaSr5MOnatylezB1IXfQ0PrhasXE+eEQnlmmGCDiYH/q
         Qkkk0/IrsGU3iKYeeT1BRtaBBCclRNuwIDmxXS8KOIOKA8t3vcxG2raCqHkcaPobZOf9
         fsONYoFpbMDSoZHWVDtq2i0283UPtOTipYhZVvxs2O0/X3ubeazrtHKrDsf9YdF/PGhJ
         yQsw==
X-Gm-Message-State: AOJu0YwOma7wCPostxXuqTfE0/ziItOUhVR3GCvK63zC6fjb5JIsle6S
	QCIhXiE3aTcGGca6HjovBVJiiLeGtP7ggODSIjDhHl3CbYM=
X-Google-Smtp-Source: AGHT+IE1KgPX6n2bsIie/Z9urV9FH0YFU65DNEbPPc884bRzH9997J7lWjXzEqQfj9H1XbmsIZp7+BSlW8EYXZkSILg=
X-Received: by 2002:a17:907:6e9f:b0:9be:7dd3:40ab with SMTP id
 sh31-20020a1709076e9f00b009be7dd340abmr4953225ejc.2.1697420972192; Sun, 15
 Oct 2023 18:49:32 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Oct 2023 12:19:21 +1030
Message-ID: <CACPK8XcTx9bd7DkguFOZ4qCxk8MJWm-yeNMLGDCnO+wv7dwa1g@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: soc changes for 6.7
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello soc maintainers,

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d=
:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git tags/aspeed-6.=
7-soc

for you to fetch changes up to 0af9e89106c359e531791c3dc2422a16bd40d17f:

  soc/aspeed: Convert to platform remove callback returning void
(2023-10-13 15:04:12 +1030)

----------------------------------------------------------------
ASPEED soc updates for 6.7

 * Move all drivers to .remove_new callback

----------------------------------------------------------------
Uwe Kleine-K=C3=B6nig (1):
      soc/aspeed: Convert to platform remove callback returning void

 drivers/soc/aspeed/aspeed-lpc-ctrl.c     | 6 ++----
 drivers/soc/aspeed/aspeed-lpc-snoop.c    | 6 ++----
 drivers/soc/aspeed/aspeed-p2a-ctrl.c     | 6 ++----
 drivers/soc/aspeed/aspeed-uart-routing.c | 6 ++----
 4 files changed, 8 insertions(+), 16 deletions(-)
