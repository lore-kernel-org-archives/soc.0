Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94228239072
	for <soc@lists.linux.dev>; Thu,  2 Oct 2025 04:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759380252; cv=none; b=utDng9RtP/yLCKYjUCmK2QEuU4Gfyu0/LbNqzDwP0DftXN0t+OvNKUpxldKDHVnx/rEb90doSMxXknLM2m4g3+MZuNHgyVa6ex1rzUjOMIWcfmI5DLzLnvD6uW2CftA3ZocvTu96hX21tWtcie/wgX/55cEyREuMkRn/soQ7MbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759380252; c=relaxed/simple;
	bh=TQK0W/dKr0M+UA0oe9PokiNx/Hzpi2k4/+O36NKUOTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PEMyY9G4N+MifltfbM9T/rwbUfU3lTyVWNVmLQ3bk8og2P7AaypCxozRAlhRkb2eO8LmsCYmaK6gHr495Mtr5I8+XdZBAqy2J4Qf8vg3KNAcI+qNtc+8qu9Yu19OmFHm3Xan8USYT/goIzogDELHKjapCx7ETN5JQiTyCGWp4Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PsOSECil; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PsOSECil"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62f24b7be4fso1080344a12.0
        for <soc@lists.linux.dev>; Wed, 01 Oct 2025 21:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1759380248; x=1759985048; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l0fNSbqDx3tVEU1b17OFCmGZksGRf1kldhowSTR+Zaw=;
        b=PsOSECil8fNxuShlsuQqygSPK/iNnBBrPGtvs7fNX3/gIMrBHda/yRmIkFYj+46hfJ
         xNd3aclLxZki5AxwrCcY+NlO2gv+MxQ5GfyLFnw6nBCO6UAif/mKlOuS7QH556EUVex3
         +pj20CWD8K5xibyMh+NRikmA0ApB0hV2pE9gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759380248; x=1759985048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0fNSbqDx3tVEU1b17OFCmGZksGRf1kldhowSTR+Zaw=;
        b=s4lf7FqL6Ew5/cAxnrCDjf08Q3HjhY+dV5nihiNDMKol1GvR2LqqypPMLqyNmmdOKj
         hPdApKUf7MEulsQdsRZNuscKjLgJqD5+MRVwvV4ehsJdtbhINnvL2UiQx1bXhqi2QK1v
         UoH1TrXPTAFcrOpfNVPX4HLOLH02XTAZZnxwGkTDMgBhjL31Ftdid9Xb933PAGP9ssUk
         JwveMWfmlPVvfPO3JcNd6ANr/OsQnALI2k/HS22VKK7ARa9QHM8h2TNeIT19D3G48Okr
         sGG+hUHBZvnd6uwQWg38sCnYZtmliWvuVRQxN6fAyi0zn0j1aVHOktgdcFDvPDtuUjTM
         Cnwg==
X-Forwarded-Encrypted: i=1; AJvYcCVJqBJaM1DSzQMrv87Otnqnf2Zr2eW0j53BZzCAOHq5Hh28zoWH1oVZ3Fry3ZouL/cKGzc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLo2QVkAA6Q+Jcu9mgwva2xS3HhqLzpB8F08rsTkzlVcaXizC7
	/XlxlXY5L0lBq4eAQxbDZ28kpg7BuzB4jrR7mdj09W37QHfTF5ksGeNBG0HFTh5yYdKK69TDVM1
	aaamx3+A=
X-Gm-Gg: ASbGncvO+4hpQK0uWATzqsuGEbJDVIY/5k5yC0QZQLultHomotvKPfZCTN2QxrDmo1+
	RnXEgt1WnyurMLPCG527c7sev13oZmkY6m1KkhtMfdXfL3y2AgySSxn6VVGqHIUqDkbfgKrXW2v
	arIx39sjil0LpcQH5LAm44ArRzjNOJL/kvVFkrGfr6QsAM/F5KFuMqod8VyxmmgXTZtiFN8ivDb
	Cs2LNj44lEB6PtNS5tLUTRVxu/ohVeWjMphB7sXlFotzso0AYA1+uyMajrWUBhnLCCgaXCwlai6
	XrfnKlQONP/CihTCnwfhhUVIyArNj1UmiJJN+agarEtThmCkdVMTatCeAxuv+XVsGGF7c72CXBL
	EVqA8XwgIfAziDamw774+xE9id7gLCaNjdztZRuGyyYIHqRLuJNvxvY4jvWefVYOnRhliX8aRLc
	VUIFUMutdx2zqTSTuceBfm
X-Google-Smtp-Source: AGHT+IHGgbKjIjZDeNhWal2eLJSvXZhz8JuLlCHkrNuzL5oE/49V7kG0i8nV1ff44Hnk8zbAvDsXtg==
X-Received: by 2002:a17:907:9493:b0:b0e:d477:4961 with SMTP id a640c23a62f3a-b46e31e0248mr721441466b.23.1759380247576;
        Wed, 01 Oct 2025 21:44:07 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865f74002sm115266766b.42.2025.10.01.21.44.05
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 21:44:05 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-637a2543127so1015538a12.1
        for <soc@lists.linux.dev>; Wed, 01 Oct 2025 21:44:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWiskwmIHfpb8GTxZ59GY698F0K4aGDwPRmflbj2PcSKwWmfNp9GnJohvFqNFCChtISX4E=@lists.linux.dev
X-Received: by 2002:a17:907:94d3:b0:b41:660:13b8 with SMTP id
 a640c23a62f3a-b46e6033460mr793566766b.31.1759380245436; Wed, 01 Oct 2025
 21:44:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <54b49f7b-9232-44d7-9ae3-ecc1826f17d7@app.fastmail.com> <d482931b-1779-4b49-9fa2-1c101bdf0929@app.fastmail.com>
In-Reply-To: <d482931b-1779-4b49-9fa2-1c101bdf0929@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 1 Oct 2025 21:43:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjsMPACg__N37EL8Sh=z1wkCpj+FQKpoVPXzyiVpm1i_w@mail.gmail.com>
X-Gm-Features: AS18NWC9nGx06gJW3k-2RDQkrnMZn65NQh3fTzpBmyJVcPDayBtYzYYuTR5Us6o
Message-ID: <CAHk-=wjsMPACg__N37EL8Sh=z1wkCpj+FQKpoVPXzyiVpm1i_w@mail.gmail.com>
Subject: Re: [GIT PULL 2/5] soc: dt changes for 6.18
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Oct 2025 at 15:27, Arnd Bergmann <arnd@arndb.de> wrote:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.18

Bah. I've merged this, but this causes build failures on arm64.

I only noticed after already having pushed it out.

> SeonGu Kang (1):
>       arm64: dts: axis: Add ARTPEC-8 Grizzly dts support

Doing a basic allmodconfig build, I get a

  In file included from arch/arm64/boot/dts/exynos/axis/artpec8-grizzly.dts:12
  arch/arm64/boot/dts/exynos/axis/artpec8.dtsi:12:10: fatal error:
dt-bindings/clock/axis,artpec8-clk.h: No such file or directory
     12 | #include <dt-bindings/clock/axis,artpec8-clk.h>
        |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

and sure enough, no such file exists. It looks like it was never added
by commit 639f8e36baf1 ("arm64: dts: exynos: axis: Add initial
ARTPEC-8 SoC support")

That commit came in through the Soc tree and in that tree it came in
through the 'samsung-dt64-6.18' branch.

Pls fix.  My arm64 tree builds otherwise, but I have to disable that
whole ARTPEC mess just to even check.

It appears that there's some serious lack of sanity checking in the
arm64 dts land. I _think_ that file ends up coming in through a
different branch, but this damn well should not have been merged AT
ALL in a branch that didn't have all the prerequisites.

Yes, this is annoying.

         Linus
