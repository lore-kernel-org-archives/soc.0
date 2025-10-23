Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE4C34CFB3
	for <soc@lists.linux.dev>; Thu, 23 Oct 2025 20:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761250432; cv=none; b=FdeyJzOavOVB65HBOpgDf958My5u1SHh4HY+63zzinjlnqq3/ZLfWwzKfo8bMIwMxOYyZBVzptxBm0WaT8cYTLGmN+HTbFMsAheDpQwE6+zNelhhI40ztf3p6EmaCfswSJPa7RvrzL8sMiOvsNSzispf6ksfVVZ2zCvjnztFjoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761250432; c=relaxed/simple;
	bh=i5rElNkVQHLPkzIXomnKwWEfC78FAMj4OakO3rUsQtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=egLWtnLnEDt3nj/KhdDFEo1vlXTfhE5KGMfWcZvzhXcRN7IuWeWjjcFPS00LjZSRtvGO6BTcNX7vv3GJDcVewu41flD9PAZMdZxaCD+L8cF2SnDsF5fp53rflIHjmjAk23L1RV5jKuqXsE1AsK2aUClleGX7BBgp6nsdW1ATIWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdbWO+xj; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdbWO+xj"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso1194486f8f.2
        for <soc@lists.linux.dev>; Thu, 23 Oct 2025 13:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761250428; x=1761855228; darn=lists.linux.dev;
        h=content-transfer-encoding:autocrypt:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V2hwEhUqYfYT/qHtg7r3dYTALVK2W+Pk3Q38aU4IIw0=;
        b=IdbWO+xjsJF/nSZOtpsJgEzsHhH/mPIjeYAsSOORp1hBSVXSn5/k0l8TcBHPgLpSyW
         GRzcd0tSdJM61WUWf52OSPmBQNiNykyDQa4GxL9WAPZGY8PV8JBs+f/iM1a+w5zlTUVb
         Mws77ArF/LIFUPZ0lH1msNR4sIP/RNS9pwYtj7LPOpztVz3X793otZcHX9SGutq74+iw
         TpNxHx392pxhYTUie6Q9++FuNFRRDEHacn0mFHTj6yjofel2gDOi0B9R7HqKMXbytMTU
         4jwh8LAhaRPVf0ASOBG2kJleU7zM9zKRcMMdfwDvZlFGcakuczVwMuOKc4SnIhuS1G74
         Eplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761250428; x=1761855228;
        h=content-transfer-encoding:autocrypt:mime-version:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2hwEhUqYfYT/qHtg7r3dYTALVK2W+Pk3Q38aU4IIw0=;
        b=TA2nGk7aFgxVXNqCIn2W3hFeCQGH0HOmTv+7KDaP/IwvoWG68RJygJ7pHSd/HAo3oq
         dxql5+xuzlp0C0u6xmNkD9IJWPAKXUPuf7wEJVcgzp9qPP3325OIiwd4nguPQKGOzNUp
         sGbvx+yCmw96KXtN7p2Nuf4xKTLPSRUBgm/UK27BctX9H1z7mv6OW91etDL+uNq9QRDe
         jqsVmBxwofDEGphd8OnjzsKanuKNgxijMzoNhMLg4taTQ0eJ8qSkzTGbdiuDUlmz3CUO
         j7nue89M4ECcrcghpVgm2qBBjR2W55bboCBXWQ33tqqiuDrhkSohO8Y50ZeaVYxLU4OS
         c4bw==
X-Gm-Message-State: AOJu0YxSimmHH/WsG83ZKMKVJz22F082QJpA4qLgzuj3XBnzdEMA6UZe
	S7TrGDTpQmNtBgdfAn3/4bZsy5OlH//B6ZWTKwXlse7Kki3smIGuJ7cO8SWdeg==
X-Gm-Gg: ASbGnctMwBYqswyQE5e/cAUz1gZYdosx1rT3AgD8vGT5CvUJehfBzW9CTlk3DgXABWQ
	qY2RhKrwLQhspagqKlsnFdSKjYLFW+PuBFk5YtbpjdqoUz41jgIlBVuWjw1BHn9vnkms1WMiGGB
	0aTL1lri2vA2nFtkx/iBE1WwvdJIat6Gp7GZBiKwySv7MTVIExfezyj6v5WCjgrz3WBYlujY6Ci
	/Nn+QcGxFnqE663dbB06edAA91kICdach9Hzt/WIX8ZVD1YetIleeQpzwaZSRj+KkKv8BraUDYw
	rr9tq+DrLagqtwRmY/6vTSmBUuBBGoUxPmbwYeqqYNLPXu3HvcT6+uhOMY7LI17iyjPQVLqoKVn
	LHtJ1T0leIOq5LTBwecrb6QOk9rEY3YhiAU1zGdtKPk1Tw0SiZCWxrNH+zEZBCkc5qKxeyfNHeb
	1geAUjcjzQ4MjEJ52hV6Yd0AVxGoyHSH/M36dOgKkpmPzJ7rmaf+IYzKtwj46HC5SUJ6vw
X-Google-Smtp-Source: AGHT+IEKK+zOGpZATsQyS1d6e2LRz9SXFTQ+r2qeVseai2EiIfrVWnlXizPcB3r0/oW+AW+IxfnYVA==
X-Received: by 2002:a05:6000:2dc9:b0:428:476e:e0ad with SMTP id ffacd0b85a97d-428476ee1dfmr10606701f8f.18.1761250428146;
        Thu, 23 Oct 2025 13:13:48 -0700 (PDT)
Received: from radijator.localnet (93-138-224-9.adsl.net.t-com.hr. [93.138.224.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898adf99sm5889072f8f.28.2025.10.23.13.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 13:13:47 -0700 (PDT)
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <dujemihanovic32@gmail.com>
To: soc@lists.linux.dev
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
Subject: [GIT PULL] PXA1908 DT changes for 6.19
Date: Thu, 23 Oct 2025 22:13:45 +0200
Message-ID: <5048490.31r3eYUQgx@radijator>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Autocrypt: addr=dujemihanovic32@gmail.com;
 keydata=
 mDMEZokhzhYJKwYBBAHaRw8BAQdAWJZ0hsI/ytTqHGFV8x6tzd5sB596cTeeDB4CQsTf+wC0KUR
 1amUgTWloYW5vdmnEhyA8ZHVqZS5taWhhbm92aWNAc2tvbGUuaHI+iJkEMBYKAEEWIQRt/0HWDf
 MUtbdrpjCtMZNSRY+tAwUCaJ5XkSMdIEFkZHJlc3MgYm91bmNlcyBhcyBvZiB+MzEvMDgvMjAyN
 QAKCRCtMZNSRY+tA/N/AQDth3Xl3wNcETvWPqqfYfyw4BFqbOD05A/W0/G0ZIjFzgD+PZVts3sN
 p5WuEwIxUrWxwavWJQBJwhXeWdru5ol82gmImQQTFgoAQRYhBG3/QdYN8xS1t2umMK0xk1JFj60
 DBQJmiSH/AhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAAAoJEK0xk1JFj60Dlw
 8A/i4lPOL7NaYoYePDql8MaJaR9qoUi+D+HtD3t0Koi7ztAQCdizXbuqP3AVNxy5Gpb1ozgp9Xq
 h2MRcNmJCHA1YhWAbQoRHVqZSBNaWhhbm92acSHIDxkdWplQGR1amVtaWhhbm92aWMueHl6PoiZ
 BBMWCgBBFiEEbf9B1g3zFLW3a6YwrTGTUkWPrQMFAmaJIc4CGwMFCQlmAYAFCwkIBwICIgIGFQo
 JCAsCBBYCAwECHgcCF4AACgkQrTGTUkWPrQPUYAEAlVKitl0w6Wun+hC0JIf8bnc0TnrH8kcDxV
 f5lAF38fcA/j8RxR/p558NTFUyHZt2Sa5AqxVkaA4aJekySytWe1YGuDgEZokhzhIKKwYBBAGXV
 QEFAQEHQMRz0l4Dnk6Vl9YqC+ZGDDpr8SkFDyYOXqdBMGad3VccAwEIB4h+BBgWCgAmFiEEbf9B
 1g3zFLW3a6YwrTGTUkWPrQMFAmaJIc4CGwwFCQlmAYAACgkQrTGTUkWPrQMbkwD+K6jiXYYMRnV
 l/5dpL//wXB1cM72ceR9tXYweMXg1lfABAOugzMF0xypW9zwYAEWVNOAaPsqtEPPYfBY3IXxl6m
 sB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi SoC maintainers,

Here's the first batch of PXA1908 DT changes for 6.19.

Regards,
Duje

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://gitlab.com/pxa1908-mainline/linux.git tags/pxa1908-dt-for-6.19

for you to fetch changes up to 0e53b0bcad00107ce82968e86ca11a23f8a91f48:

  arm64: dts: marvell: pxa1908: Add power domains (2025-10-13 12:11:38 +020=
0)

=2D---------------------------------------------------------------
PXA1908 DT changes for 6.19

Rollup of hardware support which has accumulated since support for the
SoC and coreprimevelte board was merged. This most notably includes
eMMC, PMIC, backlight and touchscreen. A few QoL fixes are also
included.

=2D---------------------------------------------------------------
Duje Mihanovi=C4=87 (10):
      arm64: dts: marvell: samsung,coreprimevelte: Add backlight
      arm64: dts: marvell: samsung,coreprimevelte: Correct CD GPIO
      arm64: dts: marvell: samsung,coreprimevelte: Enable eMMC
      arm64: dts: marvell: pxa1908: Add PWMs
      arm64: dts: marvell: samsung,coreprimevelte: Add vibrator
      arm64: dts: marvell: pxa1908: Move ramoops to SoC dtsi
      arm64: dts: marvell: samsung,coreprimevelte: Drop some reserved memory
      arm64: dts: marvell: samsung,coreprimevelte: Fill in memory node
      arm64: dts: marvell: samsung,coreprimevelte: Add USB connector
      arm64: dts: marvell: pxa1908: Add power domains

Karel Balej (3):
      arm64: dts: samsung,coreprimevelte: add PMIC
      arm64: dts: samsung,coreprimevelte: add touchscreen
      arm64: dts: samsung,coreprimevelte: add SDIO

 .../marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 267 +++++++++++++++++
+---
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi       |  51 +++-
 2 files changed, 283 insertions(+), 35 deletions(-)



