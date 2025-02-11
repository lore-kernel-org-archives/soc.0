Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C23D26E621
	for <soc@lists.linux.dev>; Tue, 11 Feb 2025 19:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739302628; cv=none; b=d1+pvDcj8fIc0q8oFlqTf5gU0CkC89eahBo745Rt9MQC1LExRxdBVAitsYnFk4b8FyjJx1E9xipXqnqssso8OpYUjluQjROU9dKhjci5Ji4l9/fQnAJvAI7UYYHthwzU826m/HedFdqkB+SJsWoUmTLdDPrnIASgBOtSmO052rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739302628; c=relaxed/simple;
	bh=9e/sGwyL68UNjItnpSAp9MDvTFErGvwXM2lfdp/wyfc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GLiM+DTE/sgVGC9FodM0c8/VfWRSRhWuG/7DO39Vi2n6Hal1jC4y4LS/x4qXgxbV/dtFPw+ZXNWg/te1TT6UQVfC3r/+4iW4wVbOj3DU09vt8siU7It04VLpRsYmFBFETRTOif7nyqOW/rbW/dSS4NLLfyL3yW+/TOhR6NxQ8c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZtV0EG4; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZtV0EG4"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaec61d0f65so1313736266b.1
        for <soc@lists.linux.dev>; Tue, 11 Feb 2025 11:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739302625; x=1739907425; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9e/sGwyL68UNjItnpSAp9MDvTFErGvwXM2lfdp/wyfc=;
        b=aZtV0EG4CB8DvHJ78BAwPe+ggSyO0difE83jVhU1wxwFY2PbUZO43/KDCfaXZukEk3
         +cUZBjS2bAKII1ApoAIeeRSUrAu6D77tQeXBA1oR5hxz0QGVrlF5QpTcX5mXObF6h0/h
         lAdK8CWv7e/x04A3UKAdPa9BccGssU3QNxHXovyrtabokPARvaDcGex8BHZMAkbo24Iw
         z3X6aXjmDFfri/5hFlLLxw4hxx3S6gNK5MVO4Oa1ojeBBnHSDCCWX4siJgtu8rs8u9um
         nlWkBBHnIRh/nnH21r6cg8ynQaFz8TJC/8qhUzPsnjhpLqXJ1JYaxWaoXq4bsRgkkKnr
         bzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739302625; x=1739907425;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9e/sGwyL68UNjItnpSAp9MDvTFErGvwXM2lfdp/wyfc=;
        b=WegtsPUy+14qo7PAZZUXVtGi0YM13ybrxLFYbS0Q6bujI5uUZ1cnsmCbrdGybXSBc/
         wweAkkAW4G8lXSsmi5JrIgY6u5px/UseAtMTLC6DnmXJf2jslE4Y1dTRTigpmb03JOHw
         aA/JcxIAGizaIjZPSAK9vN9r/ytSfRyD/vz1nYkFi6+Dm/jYjubsGDk32FP7Gh2a/VzP
         EDAbZbleLldbGT4lD8JeKAecHcXk6Dq8whUtBdr9XhQE7m0lgDNOtz1naokUcUcgX3TH
         z86LkLS3JQe/Wnh9SG3Y4/Gi0R6NStkYcurZzXzJcDtvn4QJCLNF36U0gI73ZOXZ+bwF
         p+TA==
X-Gm-Message-State: AOJu0Yza7PS8ra8TaiuIcaVy+anF6rFn97jGE6+Nv1YxRuSKHy4BLGzT
	QxPLe2J9LTWbEXB1B12ZgtNP320UH1fUn3ZI5n3u2U5ZtLECO/xC
X-Gm-Gg: ASbGncuepqy8vAYuFjTxp+i7MCgGHPKzUvmRgpGd6HB5ZjXf+GoExsZ4MgUx6gBZ4sp
	wbHhjfkffBfOFyOp7BJNJBeqzRhpSnbJkrOgPWgBtpqF6E/UHG9T8x6Y3WPk5iURe4m/ZNBOZk6
	eIhjqHr3817hJuzJLG+cqibxs5NqvYdS3RmWeB4x1bBqpaws7p6zTBRQkdWyVHZNAEPQpxRPrb2
	xh2d3upHnift540VorEgpGsE7Yf0DbWxyDWregyZaDdYlwfukUnF6xPnNZ979zLK3EatJWS8ZCP
	uxuwHSUMjtHb8T6NKpxsIYm6NBjDy+85
X-Google-Smtp-Source: AGHT+IEQ/slzGtIIDpKNl/JqYbFTtsrceMpYlWtOML0fOzvbP4uW4Jm2p4lFLsInfuuv0UWM2bB/xg==
X-Received: by 2002:a17:907:1c17:b0:ab7:d7fd:6250 with SMTP id a640c23a62f3a-ab7f347a6a1mr18121866b.43.1739302624828;
        Tue, 11 Feb 2025 11:37:04 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7cbc313c5sm364663666b.150.2025.02.11.11.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 11:37:04 -0800 (PST)
Message-ID: <ccadcdf720d6b1055165f1404fafca9b1c6c54f7.camel@gmail.com>
Subject: Re: [PATCH 00/10] arm64 support for Milk-V Duo Module 01 EVB
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>
Cc: soc@lists.linux.dev, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
	 <inochiama@outlook.com>, Lee Jones <lee@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Haylen Chu
	 <heylenay@outlook.com>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org
Date: Tue, 11 Feb 2025 20:37:01 +0100
In-Reply-To: <77c0db160bcaa7c2a68c04a0d33a561b2834f764.camel@gmail.com>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
		 <eoeyutuu4mrpsu7snkk5ll6kmm4344qsgbnncss6gerlcvvea7@usuf5v7w5ffp>
	 <77c0db160bcaa7c2a68c04a0d33a561b2834f764.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Inochi!

On Mon, 2025-02-10 at 21:55 +0100, Alexander Sverdlin wrote:
> > > It would probably make sense that the whole series would go into SOC =
tree,
> > > even though technically nothing prevents the reboot/reset driver to c=
ome
> > > in PM/reset tree. If everything would come together, `reboot` command=
 would
> > > work out of the box.
> > >=20
> > > [1] https://milkv.io/docs/duo/getting-started/duo-module-01
> > > [2] https://github.com/milkv-duo/duo-buildroot-sdk-v2/releases/
> > > [3] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm=
-v1.01/sg2000_trm_en.pdf
> > >=20
> >=20
> > This reboot implentment across the RTC and 8051 domain, which is
> > still a big problem to be upstreamed. This should be designed=20
>=20
> Now I've got it. The problem is not in the reboot procedure, but
> rather how to model this thing in the DT, because of all these
> unrelated functions brought into two HW address spaces...
>=20
> > carefully and needs further discussion. Adding these two syscon
> > compatiable may be not a good idea and cause some problem. I invite
> > Yixun to this talk and he may give some useful suggestions.
> >=20
> > At last, I prefer this goes to an separate patch series, and
> > implement with rtc device.

Thanks for your hints!
I've completely missed the RTC driver in progress [1].
I will provide a patch registering the reboot handler on top of the driver
as soon as it's accepted.

[1] https://patchwork.ozlabs.org/project/rtc-linux/patch/20240428060848.706=
573-3-qiujingbao.dlmu@gmail.com/

--=20
Alexander Sverdlin.

