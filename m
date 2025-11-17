Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983C5286D7B
	for <soc@lists.linux.dev>; Mon, 17 Nov 2025 17:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763400578; cv=none; b=g7JHzq6hSl6OBNInJR7APyTbX5iJweLbRHXJvEGPv83BSK3NwJvKyebm+8wAmhj7TqHBdKtR+etKL8LtlhSd74+HMjNkFfad0geT7FgbtUusUhVd9rh3K3EgJHKEmj8+Aybi+4kYOAVCrrVf2zsYD4PrUonVofzRxm1QnwLaq0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763400578; c=relaxed/simple;
	bh=eOWVoBy6VqXtHjNgx4XgUnlNbU1DJtIXlJJOYQmQGHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j5jTw0VvWNaBd4ElRZcbGtz0aBZ8ljDsCFME5j2s2/iZWq1ZREzwwwAAZcvEynQJIV3duePfagVsHH6R26pNwCTN3Uk12el5Pcf3NKIP5P7Aij71IVX6KMgM4HIZM9yqg01GwxpCR5dtGW74iv4Va8BKwv6ro1QNuNL+RyLEWoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GAo2Nsft; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GAo2Nsft"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-297f35be2ffso64814415ad.2
        for <soc@lists.linux.dev>; Mon, 17 Nov 2025 09:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763400576; x=1764005376; darn=lists.linux.dev;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hR9EM2z6sHnGhlsEZZ88mJGrfMpYr2YCoYJvLqYoDdQ=;
        b=GAo2Nsft9JbjGhVaMEafRUnu7YRxZeuckRTrglReRcZ3j6DpGQz9NMrdd4n8uDxP/J
         C7ZYlfsKLsmCRl1z0hqhg3Ybz2hDpWU5IMrLVDTruH5fGOBWl0a3ac5l4VeRaaLrwznd
         Adcf1CBSh/dR/Pq6jgBl8FnuITkiMHLuB6BcIGluWRSC05CPkz3NNBzvfIVjdsuZGprZ
         u5gVKODYEzQVCW9Lh8nS1R9nmW5tbbROkxHaKmrKTMpnxzuCb5eIrdLnG6ycduFu8tMj
         ar8AT84Vn3XUDyTQYgNikrufxAvvJlGEdXPS+kz2C1AJJflLCbLzmdHEMthY8qKoXcbP
         DprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400576; x=1764005376;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hR9EM2z6sHnGhlsEZZ88mJGrfMpYr2YCoYJvLqYoDdQ=;
        b=oXPboECOqEYRInnW0gzaYLtInxu7vOZXvQsKn1FI9SaPHc2NvA6I3a6yCQUKshmDDl
         d9HSelLJscs+wJKEULN28dSXhRiRpCg9VcDfPible9H212F3qrwlXifGJR0o3wEQvd6y
         Ch7syjSftm3miCh2Irny7WxaUFfvFxsIdxkmEr5JnsuiistxlNYks6PxOa+4lgA8XVT/
         iqLHGhVanObg5qYUczl4xmvER26IA1uxOB6n/eWqKEHrWgTpKpU1Ndcy/op99Jl4LViE
         CT+1xIoJfl0ve7EBa9SvjqjxlWL1smV85PV8oViiz12WPg0FJIVCTR9tIe50BKNIEI4Q
         1ZEg==
X-Gm-Message-State: AOJu0Yz7/0JmPBVyj1L8nL/gXyu83Wg8ZUkCa3gWlmO4HeO2wyw7QH33
	f2D7WEg5uc7YT23JwtdhfmwaGO+IpoiKISTHenR5F3ys5jfsIj7cAvbg3kgX+coePkr2j13YSHT
	nWm8j64Y=
X-Gm-Gg: ASbGnctmDXN9UBWLqTIqT+ZLO9P0JKzqr9X//1/HrwMe+Y93ldHc4rq+fo9S1Ftu2HC
	B7Bp/lj+NMiWa3QY78W0IH4OXahdig/sttdMpA3mf3kqHOtALakJjA85uEnsYykTN0yKiXlCVky
	B0wYQwApE+K+4k+T56DZiJtcfxMVYDUWQ+U9iOEl66BuIKoLNGQ5ewPl7xZ+8NI8AxvnQg+tUaM
	4Egxar9rLL7nitY2MwR1Ngn5Vg/eOWD14X16biR/nyaysB95tHuiKeKG+xBA5jf7SP5EtQFqiHR
	vDzZ8qfXMrVikjix8s2c6GgiR7Cqo5mZht1FZyiKFDar5xHBpBbgAuNHhmqB5xjDvN4hi+S6kDH
	zSzN+kivEev0GbEpJroekqXA6ltGQe4liQHseBcFSxeoAo1TzCkXG8bYM8WlLQddtmHK/r1dgKg
	==
X-Google-Smtp-Source: AGHT+IF9V/dBvlwYAdM9IAYen85Y0K9dLfQidM8wPheh0H+XYjGDt3ZMEs/v4nT38ZUHffpu7c/I9Q==
X-Received: by 2002:a17:902:dacb:b0:298:33c9:ed99 with SMTP id d9443c01a7336-2986a7414e3mr169566815ad.30.1763400575878;
        Mon, 17 Nov 2025 09:29:35 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bed23sm146031965ad.87.2025.11.17.09.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:29:35 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc/defconfig: OMAP updates for v6.19
Date: Mon, 17 Nov 2025 09:29:35 -0800
Message-ID: <7hv7j8k1og.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.19/defconfig-signed

for you to fetch changes up to 393f40ef96628f603b40e97b6da9847d20a904c0:

  ARM: multi_v7_defconfig: Enable TI PRU Ethernet driver (2025-11-17 08:53:20 -0800)

----------------------------------------------------------------
multi_v7_defconfig: Enable TI PRU Ethernet driver

----------------------------------------------------------------
Parvathi Pudi (1):
      ARM: multi_v7_defconfig: Enable TI PRU Ethernet driver

 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)
