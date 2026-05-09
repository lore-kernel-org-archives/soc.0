Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DF135B63D
	for <soc@lists.linux.dev>; Sat,  9 May 2026 11:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778324692; cv=none; b=l9gMl5mUTzDfcusRgysk6/nl6a8UrmbRWCzG5MxhTdfN+KOHeuxRrji8isNiZTbXU1DA8eYdbYxtrWoeVgfWxfZdS9WAMrtkOnKbumPFicLyjKE4akPaf/6R2dIHKtqfI5Ttk2M2kUSilBoklJap1I7bbwQWxAclHPG9e+295GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778324692; c=relaxed/simple;
	bh=RDKWEBJTF8J89UcBfNJ0kKi4VohihtGGHBJEbRg2Of0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NSEXFHul/eVSFnosDWXeZQMj9KIrU8UXBJ57wnzcTDfhUT004yj0CK6Wnq7y96iaKRo0GNEnqsDntgNuyIBS5E2EHbGSkZ9n4YPzTE0BhKikeCmIZ5hCTBInjGz6CUCZeqC5FjsUrDv0bNNuxpv6nr7uABjoJiEZcodei2at5Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZFu7Am6; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZFu7Am6"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so2305885f8f.0
        for <soc@lists.linux.dev>; Sat, 09 May 2026 04:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778324689; x=1778929489; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=77DfJN88weHORrd9+b76BmxRsQp2yt6hqDEbgfcyKxE=;
        b=AZFu7Am6Ja6KRLdTCdyTSHGjx1BroiF4EYX8mmB7xIUrdFP5gSogSzk4LwbBJmBQrd
         CEO6W4V0EiCGYvnbr/hKFOTGPPcqs0P25OdpvVih5SjUeKA0pBlQYPNinY73xRRFNNeS
         M4+zrFrHGoLZNHJhDDjZE3bhvTf4xiePaChDT7+E7ntW3gKpU1IxT5WxDoN1jvAiJcBE
         Xp4C251LgFTEmicqyfoHEXQG/44mK5EoxrL3FdgyOWC9E/kUIkVnnki7CGRIXRLZKIlS
         TepTv7X4shNI5q3/odu8kPKGPy9ATQfTwPgwq2HrfjiWbN0VEmHS4eAlUKKCcoMzuVOE
         qoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778324689; x=1778929489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77DfJN88weHORrd9+b76BmxRsQp2yt6hqDEbgfcyKxE=;
        b=fANizBrgzP7IbkpnYzFa4cLPq/yvjLumt5QbYIJnHMQM07ZIXogQBPgkhwnnI4TfNt
         1g80XenW0TFAWPTuRNFKokQV7OJgrXvkkLU5PT4VEEGZDQy+hYtI5Yoi8ZH1y58V8KBI
         qk0AkbOjMfdacsKT7OFIZRTswP8gg7BhOoAi9BYYbTio5Fcejd2VQ0gR0t6zaWDLbrTP
         dDlbs7rbqlefFjLZCZ5PAlz6GtgityhtehbCWdpq2+K8y3oE+pL05qoBW2OT8S9TY1hT
         zfrxSyFXk1D2dAanH1hlX5xi5z79yam5eqFuq0wKBS86+YqF33ROvtleFlPFgdbeR8S8
         7ibA==
X-Gm-Message-State: AOJu0YxjzlbE2txLAJN9eP4w36Pb6/1aSp6EdQwoCoOcEbeRxRd+qlEc
	Gp4tphikmGIe/8K63/6/S5/+LvVEFmRvaweSKdKfY1DnAyLE5XALnEMCl7hKNqSe
X-Gm-Gg: Acq92OEIK3H8XdFgauKd+tzcGIdxzzn61ffzb/yI8LWjM7f7DDoovdxNvJSazhoc17G
	EfHNARiOuttAPgizkFYzl5Kwz409k70Dzgh3JCeo9fgxqQezrWXlJ/9osU/jdb5X3Smnw8RtH9G
	Pi1QsFsulpxP/QhcWXN3IMi9ntnF+hm/Fa+Q6UQUPiR3Cpe2Km1Anu1K7chLbTYjDK3bnwopXTf
	R71xshZuw1NBn+YlJFwJi2jorA3QHxa/ZW0DNDe4ihR26I5KfLHNaMzTXSgqUYYXumSOo4nc3M7
	6r4BMDrbubUhUuDc69ubdv4a2CGpopKXx/+ZM3p1Xi+VOfAPETW1tQ0YSm3z2qwWNnfcFnYe6Em
	86ic6Dw3TXt43mPQ2UYUC4Yu733i6jHfSE5L5nZZ/tLy+j0iOLC+iTVK6TbmID6e+lB44KMKyy+
	fjugGqhZ3pG54Q865FRRZBNn+2HlN1IyiUA/gDY70BFJqIMlSsmR5hJix8uaAkWDdZ6Z8zLat9S
	bA5tOTYUTx6DGfW7NCPv0JQ2cW0QyilSn8=
X-Received: by 2002:a05:600c:698d:b0:48a:7676:30bc with SMTP id 5b1f17b1804b1-48e706f11dbmr34649275e9.14.1778324688824;
        Sat, 09 May 2026 04:04:48 -0700 (PDT)
Received: from radijator.localnet (93-143-243-205.adsl.net.t-com.hr. [93.143.243.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6fffba52sm42242995e9.3.2026.05.09.04.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 04:04:48 -0700 (PDT)
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <dujemihanovic32@gmail.com>
To: soc@lists.linux.dev
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
Subject: [GIT PULL] PXA1908 DT changes for 7.2
Date: Sat, 09 May 2026 13:04:46 +0200
Message-ID: <KimLSS9zQ2O_qT5luvFs7Q@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi SoC maintainers,

Here's a small set of DT changes for PXA1908.

I must note that I've changed the repository and my PGP key since the last=
=20
pull request.

Regards,
Duje

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://codeberg.org/pxa1908-mainline/linux.git tags/pxa1908-dt-for-7.2

for you to fetch changes up to 52c47f734f934fdd83659e1a7b096597cca14522:

  arm64: dts: marvell: samsung-coreprimevelte: Add missing SDIO properties=
=20
(2026-05-05 16:51:26 +0200)

=2D---------------------------------------------------------------
PXA1908 DT changes for 7.2

This set consists of a bug fix and three QoL fixes:

* Fix touchscreen breakage in low ambient temperatures on coreprimevelte
* Free up most of the framebuffer memory on coreprimevelte
* Fill in some missing properties for pre-0.2 PSCI and coreprimevelte SDIO

=2D---------------------------------------------------------------
Duje Mihanovi=C4=87 (4):
      arm64: dts: marvell: samsung-coreprimevelte: Increase touchscreen=20
voltage
      arm64: dts: marvell: samsung,coreprimevelte: Use memory-region for=20
framebuffer
      arm64: dts: marvell: pxa1908: Add PSCI function IDs
      arm64: dts: marvell: samsung-coreprimevelte: Add missing SDIO propert=
ies

 .../boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts   | 11 ++++++
+----
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi                  |  5 ++++-
 2 files changed, 11 insertions(+), 5 deletions(-)



