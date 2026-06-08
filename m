Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAD53F4DDC
	for <soc@lists.linux.dev>; Mon,  8 Jun 2026 15:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931988; cv=none; b=rl0Z1uYIq7RfzrIMYmsntC3Y2IfuBA4cg9/UxsMaFt6KCcZKmnTkdq00y1DGL7p2paSr/FCq3bW5kyNeaTg2H+caZ1vneLJMwDftizGFy4OQ8NXlv0H/JbKHu7e00jaUFy6Bbtw2WDBxM7AJ1MFRwIF9u+U2/fXC3kuzA8qIuyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931988; c=relaxed/simple;
	bh=k1s0VB9TgaMOMV66fAfiCRAE+O1DR3Txvggw9WOuKn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FneSArwuS8kyMxTFDqVlF+SdVbzk1r378dLqtNRHAoZlP3eeva68xXHTmAfZAVEzZcteeDiBbbnb2miti+/PvL4FngYs2mV6ucjOXkKTvNH+HYJcJ93yyr7wyqEVyTwvCGU5rmWfSPzDjtgRVcLSfRj0Dis9Taf/MpKGhIA3McI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lMS3WFJJ; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lMS3WFJJ"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c8583b8fd89so2751260a12.0
        for <soc@lists.linux.dev>; Mon, 08 Jun 2026 08:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780931985; x=1781536785; darn=lists.linux.dev;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=33VwqNJKC3vQHdZOYexSv3O8gJeHLE5NCtrHEddwJEI=;
        b=lMS3WFJJoQlj2sbb8QvUpcjnZQIAj2O4wDo2F6vHcmUVEzJbzxsXT40YGKJtUkD1Nc
         wtq0quUIYEF+Xn4Zr1VuFx/XZ7HfVgBAu53ySd+VIQEgCXcdZDQskqnjZzfpIUVFR2fP
         Y961rrzOTDPQFbaVwxXEH91xfp9VYajMjK/DSF8BtqZif3Om/HGjbAwf8Iq5/BYKKx9T
         0uOki0LF0hIEbubblHarfQ0kDWMNJkj3hKHmg8Sejv58Ncg3F2Syi5dyMRVrheVs1erF
         ziAfcl6n1jvwC6dOlxuzXJ16lOLRY7RaPRpcGn6n5C3UMKP3UKi8fIIvx4kVkTKWuzXK
         5tjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780931985; x=1781536785;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=33VwqNJKC3vQHdZOYexSv3O8gJeHLE5NCtrHEddwJEI=;
        b=qIbEJ+izlbiRMv9uz5xvR2h1CfmjxoPp8DLQOAXXTQX/SIxN5NUJ4torLo8InGgpJj
         N3NM0RCcINO8kaU7gzbtDBIFqVSDwd0TK9U4s+Kx4bkz+OAu7oymp+GgmdgyKCRwgvmk
         87H6R54E3Q+TBwHHwQr14tlxafko+gdE8/ygkjDKG/4V8dPmCDqs7k3x0IDH2gywSi/0
         u1vSPpKoI+7ZBZlzaw8TOBLpzvbGRo5CmDVKEbwb0LaW/i0akIffu5BIcX12C1kStkQo
         vw6YU2FciUzcz+wQH5g3sAi1xECxG2U133t+1SWSbhleIx5fm1mEb/0xWEaO+rrWqj7y
         i1jA==
X-Gm-Message-State: AOJu0YyPyQwoG01grGiVUajyKQNQVCWeYWBllLPK/SSehTJwv4t6aV8M
	PxiwsGrWw+7RDpj2sn7SHSr0auY7y/7J+L1X0yYhqs0oKEYNiFA4qWqyjwpkNOpJN9AyhCF6Ds+
	ByXPQgq4=
X-Gm-Gg: Acq92OEw1AiRtxUvvvLo9q6LMPo7/JFbJSEDbo2j9rZECPOLNX9TF/xX27TgPhg9fAg
	+giypobsqMHqOEVAWJShTqcdhvVl5NWYnAmG6usyArjlF2XbRTDqe/Wfw1lCGckT5B3wBQKD4iw
	aseA8vSZVUzd90dzlP7pooLqfWpDtPJzQxDB5REWiIHPFrre6Xfba9Q0HuicuoEZNTmcW22sm6d
	Qtbzt6f9E2A+HPiwFSSY7BjdA4tAGFfFe7d5i9m1KJPAuh+ACSWxeUxpng2qj686hTSfE1th8i+
	gOzZKqjdi3ulG6gTvz8DL48RKstmx/VXhrmsHrmXjhf2gLn0kdesDZ+TzsMU0YaqrV2VDxSZibd
	AruDAzfq//W46O2O035dkjTnFL7wtMT7UuL4AtOckyLQr8S947SwwsTFj5lMvm1fAJUMVazsN+0
	1tpXZPvKNRllfsSUiBVhYI/8FcA45WRrk=
X-Received: by 2002:a05:6a21:2c11:b0:3b4:81b4:9b74 with SMTP id adf61e73a8af0-3b4cd0cbd08mr20264896637.42.1780931984644;
        Mon, 08 Jun 2026 08:19:44 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-c85df0a505fsm16290448a12.20.2026.06.08.08.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 08:19:44 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: OMAP updates for v7.2
Date: Mon, 08 Jun 2026 08:19:43 -0700
Message-ID: <7hqzmhm54g.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.2/dt-signed

for you to fetch changes up to b6aefeea7b4aa9158c1dcec8c050a678af7bf9b0:

  ARM: dts: dm8168-evm: Set stdout-path to uart3 (2026-05-06 14:23:24 -0700)

----------------------------------------------------------------
ARM: dts: OMAP updates for v7.2

Minor DTS fixes & updates

----------------------------------------------------------------
Andreas Kemnade (1):
      ARM: dts: ti/omap: omap4-epson-embt2ws: fix typo in iio device property

Christopher Obbard (1):
      ARM: dts: dm8168-evm: Set stdout-path to uart3

Ivaylo Dimitrov (2):
      arch: arm: dts: cpcap-mapphone: Set VAUDIO regulator always-on
      arch: arm: dts: cpcap-mapphone: Add audio-codec jack detection interrupts

Jihed Chaibi (1):
      ARM: dts: am335x-sl50: Fix audio bitclock and frame master endpoint

 arch/arm/boot/dts/ti/omap/am335x-sl50.dts              | 4 ++--
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts               | 4 ++++
 arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi | 6 +++++-
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts      | 4 ++--
 4 files changed, 13 insertions(+), 5 deletions(-)
