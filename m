Return-Path: <SRS0=AxmB=N6=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441BDC30658
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 21:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 130ADC32789; Fri, 28 Jun 2024 21:08:27 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40977C32786;
	Fri, 28 Jun 2024 21:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 40977C32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ec50a5e230so9895251fa.0;
        Fri, 28 Jun 2024 14:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719608904; x=1720213704; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQ/W9G4dZKCyzjAYQZCsNtmrg6zW8mHgl+YEz0860cY=;
        b=aYRBWx1rBajXTUMTDKiyN9LWxTzrb/78RXPbK8zKIoBlFbhToeGahFCYOVo2Q1sD+w
         hTt9LFA2rXJHDBFn51rDTam+INuBGNROUTJk/ZbVVmjxeOuUg5/cK7wbTFqWgZdA8N0Z
         AM8jg+CWtLu5MMscfCYapECPxq4P2ASZAN1mmFBrvfoEe0bui63FsJkxFm+vKhsiZIvn
         bEDzj8n6uGqHjpejYtTTqeUgM5dkMW6LhmnB599GZOXNseLSdWzrfpZYCoY3J4I7Wepw
         dkpyheinf30AAUsWQqrjLxN17oSJxtCbxJgPmdaHeW6FO7RvFFTuTk4bbG8cJFuZaz+u
         94WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719608904; x=1720213704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aQ/W9G4dZKCyzjAYQZCsNtmrg6zW8mHgl+YEz0860cY=;
        b=CeHbz5Q3BMEWTSAwwXvTiPJUjzj51L5r4EGofU7IAGfPWUA4YHZZDeEWAtGCMwzH/w
         PVh2ZXpRxUUGUj1I6+094tLD0odNOKNxs/tXlkNZdhaH1++aoO7/9ehKqwtF/uPwCqP7
         Y2GiP3teIVyKQ1CJLfg7XPCcSgp+S+jivoJGOjhhAEK3CRcPnu4nxhXKZnOxA6NMvmC3
         rdlchA0B4rPajLRLR1KSvCUqkGk0EzrSAXJAqSXOyjUYgAAuTMD5rrCHAJUF11fuCRTi
         cZ1+uqEbQ/oKYzva9dD3clyaPdQwxlAw0SdzIhUjNKesyLxrnro1o6VwT2jW4eqkPcsW
         WCOg==
X-Forwarded-Encrypted: i=1; AJvYcCVxGAX0vQRtwG4F3sJ1S9+dmvsu5XBGh5J+lpQTLwyGRBLQ4lRcoU6ZaS55Rf1OsQAaAKLsBN75vynJ3Xt32g==
X-Gm-Message-State: AOJu0YzVFtg+0pEM8cYFg9PjAyWhh4p61nAsIz2S/86lpbiy8yVl5cbi
	g8podTEo+UTpcuP3pH9sTU2SPUX1nMmDdwOTpGuuqXu4sHXvooVgD0Kdcw==
X-Google-Smtp-Source: AGHT+IG4ZgoDdwjLa5g14lGKtlAXhoLYbG+jdBqhScB02SXst7kZT3jB1EB2OLcYIlOGTKamxF2qqQ==
X-Received: by 2002:a2e:9355:0:b0:2ec:5b10:685a with SMTP id 38308e7fff4ca-2ec5b27e816mr109127741fa.17.1719608903013;
        Fri, 28 Jun 2024 14:08:23 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b09aa32sm50642725e9.34.2024.06.28.14.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 14:08:22 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/4] ARM: tegra: Core changes for v6.11-rc1
Date: Fri, 28 Jun 2024 23:08:15 +0200
Message-ID: <20240628210818.3627404-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240628210818.3627404-1-thierry.reding@gmail.com>
References: <20240628210818.3627404-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.11-arm-core

for you to fetch changes up to 237c5c9581b4f66c0ad37c6f67c14c79f0847595:

  ARM: tegra: paz00: Use software nodes to describe GPIOs for WiFi rfkill (2024-06-28 17:52:16 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core changes for v6.11-rc1

Uses software nodes to describe rfkill instead of using a GPIO lookup
table.

----------------------------------------------------------------
Dmitry Torokhov (1):
      ARM: tegra: paz00: Use software nodes to describe GPIOs for WiFi rfkill

 arch/arm/mach-tegra/board-paz00.c | 50 +++++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 18 deletions(-)
