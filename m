Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E832882BC
	for <soc@lists.linux.dev>; Mon, 19 May 2025 18:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747678032; cv=none; b=AxUUI2sQc9oBGrGbwGUNOmhmzv/Tsp7ZdvXJuDV88ygEmeQKkzLfQLYQq/8P6ZhPA2gn6dHw8dSTrn950DtPGN20mOtnKCIRDnr9rZC+QH+tB9yzOjvDFi9P8EL/A6G5CsFzqfkrmLywzNw+2rXHf7UKQ4jyQa11HIY6/z2NBtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747678032; c=relaxed/simple;
	bh=zK5nIPF/0gbJ8aVna8ILvsLahrjnTgQt/3wJwhoSzZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sOP7rqgrjtXVUY6Ouf8gOOYiNjL+JHzx/uOjuHdQHjx3VJm11pnURKJJWqIw40U1rSgMW6H+eAutoPJ8H/jGzyStp60EbvzBreaEa73Q3O9VPEuI7kfQmngPzhB8pgm6NO4Q4OvZfNGOYTkwX3hcInHEKZ95ER04ONwW2Ynvjt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtRE8e7N; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtRE8e7N"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55168f56120so3454994e87.2
        for <soc@lists.linux.dev>; Mon, 19 May 2025 11:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747678028; x=1748282828; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zK5nIPF/0gbJ8aVna8ILvsLahrjnTgQt/3wJwhoSzZM=;
        b=EtRE8e7NhVKuhXNWL8OTrm64UQjwZD1rm3YfdB7qZJgYN5pt3ej3GVWPJP8Q5iB+7c
         zzvZeYmew33RAFhkurn81RpY0Sft5AZgk2IvMA7DfS7HdajH0E124rVAg4T/7AyZQmUM
         7dNfQL1Bd9BjTCwnGIGKAKOXA/gdSIAA27Ep+OsgeAuo1qmZbbCwBBsZzGR8k4P0B8qa
         4zGEqwE/yELG0VTfAx07YkwDOr+Fa3MOoGdSLQx+co12A98MLkL91VgS8ohNXY0QdjQW
         CNzuww2tTU1Kpr4WulFE0SSnz57wcd96pTrBd27xPPNihufuFiD2LuXNGqCWgPiUH+bI
         mlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747678028; x=1748282828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zK5nIPF/0gbJ8aVna8ILvsLahrjnTgQt/3wJwhoSzZM=;
        b=dPwjyLbdh9OMbm0gTtqBgYquXXT9qK00CByY9diUy/hurRk7ObbiPgmMIWQeC0tAd/
         GLmai/CS/294FVCB5WcO1mgVa51QqfcNT3UzQd51CTQK9VmzDwy3N7voKVimWqL2UGQB
         3+ktkeyG7D107rcWFjxqBsrc1sflo9uEfSexoORU61sqgjuRuwLn/8thiJOpIC3xOX9z
         jYKnzbmDmC9sfYsGenkAX22TyYUqv71GLC4/M2/TsVYtHOS3iTZbV87C6CdrpxC2DgHZ
         7kBVPmIP5w85yAq5fVz1WrPqEH250Kr7oMS2i4i02knU+x32Vhcwa/O7skVCzyYj9JtV
         H3ag==
X-Forwarded-Encrypted: i=1; AJvYcCXhm/CGoyBJFV1gSpZ3yHqAhEHyKVb0wZPFIayTXW0mWkiBeIG/KyefnDUL1pPyx7GkXEs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqwigiVIZNhMyCajovmCIbKfc64eWu5/buLtAFiH+1wHv0KDXO
	j3F6JRASWkvY+FLS/4ZUG09qKeXT2HFirRbq3xanCJNRATOZLPpqxg7hSlewO6wFpYiG7uTRNgC
	19X9ErCoEYc5VLSNADnIhn2BxWtj/QOY=
X-Gm-Gg: ASbGncvUHoB+qRwEjGV4WbNYRF0+77L7rx6Ej3dplVvcibkhz69AMgnRi95UJaHOMi1
	w3dxmwOD0Ha5+Lgy0jJMWZus0LWXnI0lDe4BPTObfyuOTl64VeY+FlvthEl2Ek/JkFUjI5SFYBw
	+EBpRXhAAqovpx8AXRP69rtcQvEWyiJJy0dev1YuyovfK1+uYu61pKy86yXQuQoNso
X-Google-Smtp-Source: AGHT+IEsSwerskMF1f0teqna3+W64qx/F+SHnETSbfNu4VgAGrNqP/iI7wOGAZG3FONb2MQddBp41/ErEDylJVM2fuc=
X-Received: by 2002:a05:6512:6289:b0:54e:8172:fb6e with SMTP id
 2adb3069b0e04-550e7245433mr5044522e87.54.1747678027829; Mon, 19 May 2025
 11:07:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250516183035.685914-1-festevam@gmail.com> <175cdb8a-4fcb-4492-8d64-e59896b2448f@kernel.org>
 <2c72c0a3-6b30-4525-b27f-6627f6a078c2@kernel.org>
In-Reply-To: <2c72c0a3-6b30-4525-b27f-6627f6a078c2@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 19 May 2025 15:06:56 -0300
X-Gm-Features: AX0GCFtgNbJvBkLBJhWeCag0_i7WeLTSB5s2uo3e3mQxSC2xrjXARxvge8DDKzg
Message-ID: <CAOMZO5CZvjrXV3k3hHWCWo2CRsOvR7Epw+RW8=Q=Y1qjGctVmg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add ARM64 defconfig to its section
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arnd@arndb.de, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 2:37=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> P.S. We have it explicitly documented in maintainer-soc profile, so with
> this change probably you need to update that document (with its own
> rationale).

The reason I submitted this change was that Arnd asked me to resend a
patch that touched arm64 defconfig with soc@lists.linux.dev on Cc:

https://lore.kernel.org/linux-arm-kernel/ece2df8d-acaa-4554-8c82-24ed45f3a8=
a4@app.fastmail.com/
