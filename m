Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3A074C14
	for <soc@lists.linux.dev>; Sat, 31 May 2025 15:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748704470; cv=none; b=DtQLAkDYz9gzuXJRdLzYB6z1pXLsb4hpvbmve3c1zE0+CRELP+da/dKFbu6gyp0ySHJBvd2TrA26EcHczbRgm65TPk13hO2f0x3pTgxm/l7wzWo4+QmG0wEfx2++rFgmSlo0EvOMAsjobzNhaucACALL9iu0HR9d82n2H5kOBH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748704470; c=relaxed/simple;
	bh=T1nOel4UvVfsq0pDQKlA8OugRmHexP8T6OeA7iXIDdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M5XdNngdTzeSSrt4cTTdsBLx16fzu9HStca6P9aZBlUsu0JMkW4VIRLXs+KxZi+Ka2DcjBhggkOdA8rdsKH2XzyYOFxLUpu9RdW4rnmo6BFYFX/ws5sEsshdwyWNFcc3ucCUfkfWATDh9KVtvvtayIKrT8oaSYkSkpL7eLoJWB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DDtE3/CQ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DDtE3/CQ"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-604e2a2f200so5601235a12.1
        for <soc@lists.linux.dev>; Sat, 31 May 2025 08:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748704466; x=1749309266; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lSSawh4TJNRt/0sWPEPpqG3dCXsETs6+b32NUQaU2jQ=;
        b=DDtE3/CQkJrIfENMN3KuAAXvunDXcVSBx4vVE+xEcSZ9MnUAtqdNLPg+OqhIet+L8E
         WKJVeSIO5/ZU+tU0/pgWl7ruedyQC2RYIy/T63hmc6fwB13Qg3XpMGfp2dmiLM5aLdzh
         W5m0KQSUvBAD1UGhRTk8qrs4ZGptqnpiNpIqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748704466; x=1749309266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lSSawh4TJNRt/0sWPEPpqG3dCXsETs6+b32NUQaU2jQ=;
        b=C15BXFmJg85UXjjhkYmYRdKJmVqk84CbcrGflGJFhu8iOwTNenxh9gwyT8PvqIz3is
         8gIAHbowM7vBRBxE8dlLj5aRZA/afhwJyNLr3GDDd5TTBVAi1aiOZK1AhbMyC2uhAOZv
         tE3ouYKLIe16Pi4U4n7aqHuVsf4FDAxLziOicKLkObiR0LcOQoTpsY5wnyzvMAVCDhSO
         TFIFncXwFgjvtz+O54b05qVCiTXst1zncIVP7sKB7PsENErDiej/19qOyRFWEHYanXhj
         WkaF0XVjZJkxWxbfzeZZvUrJSl4KaeWJ8sySTnT1lOpPSs/S/RiTcdms8TL0cWqk/vtF
         HV2A==
X-Gm-Message-State: AOJu0Yz8LHatZ9dyAh467JxkPZOGQb05G4UzfYtApB94W6Axc/SjIQmm
	XOdLfc7hJwlQmyAM7lNLUD7kHw8lssrqScPxU9X7Mr55mOcnesZa0Hb0Y6/lxTrvyQVEybCAprF
	/GSFNjQM=
X-Gm-Gg: ASbGnctPCrjHXW8rhTnA9pLDh2LSCw734lgSbcHK2Jp8B+QJu04oY2bkBhgPo2SJNiK
	DOepM+uB1taLD0H6GJ3Jg2MGDU014pmnhDqLoid9O7xf3A2o3mAxw55gVXkui9jaJtCQBPnE9iX
	2eB9f5bONHTDNT0LNlVvK1Str6jsBOlTDmra6icMFFBK8087M5j+4gTSocclz2CJP0rfgs+h7SK
	tOCY5MNoKoTalhxHXCGdH3glaLUSL+Xlc+dNik2U2KYtnCEicaqFv5r8BgVP5OPhBWcnplreAWn
	mUL0Kt7WDkDKd6buO+tFVfTaVCxOIjYjPnze0nRw2mhRimolLYwDCeCqmR0mVYUMuSNgpw2kF/Q
	DEhWiUvU2j+eHOKQmOWuMIwmDfw==
X-Google-Smtp-Source: AGHT+IGq/jCKC4NokdSvCuJuUpscVIMtxhnRPjttvtF9wb4ZgrvBtkbvm5ZjsEZimzPDCgquuHOLsg==
X-Received: by 2002:a17:907:96a2:b0:adb:335b:decb with SMTP id a640c23a62f3a-adb493e14d1mr204078766b.24.1748704465920;
        Sat, 31 May 2025 08:14:25 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d850d88sm508729966b.77.2025.05.31.08.14.24
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 08:14:24 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6021b8b2c5fso5578046a12.2
        for <soc@lists.linux.dev>; Sat, 31 May 2025 08:14:24 -0700 (PDT)
X-Received: by 2002:a05:6402:42cb:b0:601:dc49:a99f with SMTP id
 4fb4d7f45d1cf-605b7748f23mr2083379a12.18.1748704464453; Sat, 31 May 2025
 08:14:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com> <ae82a64f-fe42-4abc-b298-1570ed17771e@app.fastmail.com>
In-Reply-To: <ae82a64f-fe42-4abc-b298-1570ed17771e@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 31 May 2025 08:14:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgHeidY7Y65-4N9AJEy69jEJRo1S9yQzEJ7_J6jpJMfVg@mail.gmail.com>
X-Gm-Features: AX0GCFuT43-u4qtV8M_qs-fcu_pSqgRGcd6qMnD3Ro4tTsTKzf_cc8MjRwFbJzA
Message-ID: <CAHk-=wgHeidY7Y65-4N9AJEy69jEJRo1S9yQzEJ7_J6jpJMfVg@mail.gmail.com>
Subject: Re: [GIT PULL 4/5] soc: devicetree updates for 6.16
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 31 May 2025 at 02:07, Arnd Bergmann <arnd@arndb.de> wrote:
>
> There are 11 newly supported SoCs [...]

.. and then you go on to list ten of them. Or 12 if you count Amlogic
S6/S7/S7D individually.

Just checking that I'm awake?

           Linus
