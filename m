Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0123C2768
	for <soc@lists.linux.dev>; Tue, 17 Mar 2026 12:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750125; cv=pass; b=QNGuqdsRRFzJFPJcJynujp5Of/F852dO9Z4uC4UFzj6MU+thCOCwJWV5eagNYXjCYCiXkMeSusa4zyabeF7KdoFUo0uuf25R8Dd+nRYBMtx6ltJc63ICMPmcKj+NFRG0hCrN5GMSIUeWQZtQCQaCZZSIZUo4M2jK793yrkUtFzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750125; c=relaxed/simple;
	bh=YRDj1iXwP8bDi9EJu/2TBiPQRfLWJSBLDfJUJaQUHIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EDswIOiwerhfCNZpbbecxDlumcV/+OHOfmaCLURSTibv/otE12cykDr/zPrpaUO/33h1mQalfRyoFF5DiEPecoSdIFueV3uFiCNQcY4ogS3zcwmEFEROYpnFlWVP5n0ohiuCz7dnCrLrKtrr5xAjCH/5Qgkav+ygc0NxSYN4f+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l6hYdRx9; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l6hYdRx9"
Received: by smtp.kernel.org (Postfix)
	id 6CA24C2BC86; Tue, 17 Mar 2026 12:22:05 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CF8E0C4CEF7
	for <soc@kernel.org>; Tue, 17 Mar 2026 12:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CF8E0C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-40438e0cba6so3589206fac.1
        for <soc@kernel.org>; Tue, 17 Mar 2026 05:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773750122; cv=none;
        d=google.com; s=arc-20240605;
        b=gjfxHPDTJLe7ZA2xNu62hH3PKhIqNmoJgXHeODQbkXqMO/7oWUg1k04VM/H51bxI/h
         JjYE1mWoQP7BtcPjDvbVu2kkVTw1AxRmnAccieRX4orxaMNzAy4ind2JN8IT7HxtXJ5W
         nRy91qgQj6iUoYGKVip+cn/X0rpV5mJB/A9fFSTQTesVcTsT4lJ23vSejHa4pQRsj6pZ
         5b8rFvsXS/9PZXn/pdGVNANmmdbUgSMnmf1cw+0cq+qeLQ2cbxefsq1p5b4fjL0qwmc7
         QxCMR/dri+2ngBQO8Qd2wFNdanYRg4Fzux68re1/AEspfd07tXD+ndWK8uyR58FpKLYR
         8Scw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZZAlly6r9Aj/G7mBI0TIakScb7FVS3esqnlgh/50biw=;
        fh=9ISiXjyBemo7U5gUCSFSH2HqRZCyubDNqPSwjsQrAq0=;
        b=Ge7p8t8KEvCx8i6eAXzxwmgeRJL5mNAmUVO5w5uUDAtir/s5QpLz669RwHQ4F3lwuy
         wNbuPmaQZsKScHDaU7+WDVH58cIt3rM2CKa8mw7ZJ2ueLs7BDagNGDfXuMv/wJUdT9g9
         ELS63xHSOylFtDS8Acz4s73HBF0BBOGJl+mVu14viWGk/7FercmJkw0j+1swn/b9tpdZ
         G+qdhqe7JGspCiBm+RN2MgINaoBHVwW0m5zf4257NRlsxHn5sL6+M5QK9rdcLjMXq6bM
         QSv0QQizGBJhfcQXQ2FbpljQJo0d48FcomPUdQZcP8ePb7ZiIAVq3Rev08HgBKBG66Sw
         NzgA==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773750122; x=1774354922; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZAlly6r9Aj/G7mBI0TIakScb7FVS3esqnlgh/50biw=;
        b=l6hYdRx9l/MHp7krJwcYaDtctY4vuWehDzSvCrRf8/FKwAAkXg7jtGNzNG5UdJ3zJa
         HisSpAAt3gvR+0IcGWq16XBvOK/6opHKsEuZw+ecI9muoP5bs4kuty/3lV779UNOAa/r
         oxQm2tuLNQNbOYiDOB0O0h1ztveCT4OMO1eys1FezcB0MfRVaX7fjVQpDAumXWLBXU8I
         AQmI/8Rn5pWnzP8S/7JU5cq0JwyDKKmRw9agtjd6qTTPckpe7zrZW+QBqwigUpxWij8L
         zJtag5NhaQuzry/m8H6JC1q9VkX+a+NYaMoZUlGg2yfdl7FTM3P5G3swElqhqRYbU9I7
         9yVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773750122; x=1774354922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZZAlly6r9Aj/G7mBI0TIakScb7FVS3esqnlgh/50biw=;
        b=BFZULlqimUg2y139LSLbyDkyaRKLeEsShUJP4YBoVao0uk5BL/hYklxODbBqI+XElR
         vPD0u+Dzkp/X2//XHI2wZfI+0iKLMdm7nS5f/BC7cBABdPkC0u0N5skarTSkxRLPFA+z
         OFsb1r3W8M9RsXgon2Rgzefkwnlls/lV+igrlL04cW0QTemiV0LPYYd0YNq9XaNBFJCv
         RrR12p6LScCLeo0fPZAHEoT3zb0pQTF5b6+VX4szfPxS2lZdijuz5chOGqxUxz4TiIfE
         qrLyo4FecQ+DjH6Ysqx9N5BUulhMPseUufVajYo4ljYXG3+GXvvvemaEE1p0STLX77Nm
         zrIw==
X-Forwarded-Encrypted: i=1; AJvYcCWhCqPxca/Qpw7FNtSdjr7F5V7ix3SvEPXdo0/Kl0XIDMUqoNJkByqS1FFKx4w8LcBwHRM=@kernel.org
X-Gm-Message-State: AOJu0Yy421+N9P/A/lDvOfrwQ3g5B3Yjh3vj6bhwumOf74Qu+Mz3RUDw
	TCxcA4IfEAhfSqPmeRJ2Z8CZdT1/lshxrPpwekSuwnhCMAyBKUjkO1imDRWykYUmDJODLQMlSad
	Ya7MQNfQcG3UlkaYehR2gk1R5CsUdNo9AaixzPEcc+w==
X-Gm-Gg: ATEYQzy+wE/V1wMW86iu9VBead/w3kh1/m2g6aaVq1xojKMIXX1+eZaG5sbX7sWY5AS
	sOGueVy/5RUoeEk2BRCW4fycg/mHREX5PzGpGMM2xIIXfoxW8HPkMiG1BZArYnG3P4SySeJlGvD
	0TxlB6Jh1yrJwaY8V2B5Cmqg9qA+Emswg2E1XGptJ3s70v8Y/bUpwBKFkuSB+o2rYa2T1MCpJsI
	iFDztzSf0P4tIxy94HQ5tDSvDyY81dk1U9Giu8SLMhrCJVgwM7JSUGhnlM7/FWTo+JNGj6wQhhQ
	a09cmhnKj9526HPaShYWLaVXGRRddcbMmNvlOw==
X-Received: by 2002:a05:6870:21c4:b0:417:5105:a735 with SMTP id
 586e51a60fabf-417b939919cmr9271254fac.33.1773750122269; Tue, 17 Mar 2026
 05:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260316074150.GA2474723@rayden> <20260317-illustrious-finicky-frog-90a86c@quoll>
In-Reply-To: <20260317-illustrious-finicky-frog-90a86c@quoll>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 17 Mar 2026 13:21:50 +0100
X-Gm-Features: AaiRm50DKtbSrt7RM-eiLNZ8ayhaRAs54Q936PCav8QiX1F0CvpkM0JNYHHVlF4
Message-ID: <CAHUa44HXjrPbPv0sBxzrW6o1iQVWdp2p-1-jroukZ8dxSvPmMg@mail.gmail.com>
Subject: Re: [GIT PULL] TEE shared memory fix for 7.0
To: Krzysztof Kozlowski <krzk@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	Marco Felsch <m.felsch@pengutronix.de>, Matthew Wilcox <willy@infradead.org>
Cc: arm@kernel.org, soc@kernel.org, linux-kernel@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 17, 2026 at 9:51=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Mon, Mar 16, 2026 at 08:41:50AM +0100, Jens Wiklander wrote:
> > Hello arm-soc maintainers,
> >
> > Please pull this patch removing the refcounting of kernel pages within
> > the TEE shared memory helper.
> >
> > Thanks,
> > Jens
> >
> > The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5=
f27f:
> >
> >   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git ta=
gs/tee-fix-for-v7.0
> >
> > for you to fetch changes up to 08d9a4580f71120be3c5b221af32dca00a48ceb0=
:
> >
> >   tee: shm: Remove refcounting of kernel pages (2026-03-03 09:03:04 +01=
00)
> >
> > ----------------------------------------------------------------
> > TEE shared memory update for 7.0
> >
> > Remove refcounting of kernel pages in register_shm_helper() to support
> > slab allocations.
>
> That's a supposed fix for a year old commit, not current RC, and the
> commit msg does not explain what is the bug being fixed here. Looks like
> it is doing improvement, not a fix. Can you provide here more
> explanation of the actual bug being fixed to justify this going to
> current RC fixes?

I'm under the impression that it is a fix rather than an improvement.
However, since it has been stewing for a while, it's clearly not
urgent. I don't have anything specific on the bug fix, other than that
we're supposed to stop taking those refcounts. Perhaps Sumit, Marco,
or Matthew can add something?

Cheers,
Jens
