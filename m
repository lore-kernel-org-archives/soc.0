Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946CC293C46
	for <soc@lists.linux.dev>; Mon,  7 Jul 2025 09:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881944; cv=none; b=NEhOiPbVg/1eIbQoNHRbjP5MRUCa3v8ADpv+VlqFhqxk9j0V2q4sWZFriP//F4DcgKPmePiczr1D7MXcvJaUVVllzYN4JsShteia+t9GlW/9famBC1Hc/BNfg/ekZZRU9ywQlQhUqacLwnN7KsUUN/jqSSLHrcH/wCjhb69DIJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881944; c=relaxed/simple;
	bh=g7c3NUc4IT5dshb3pb/tBZWnh6ur52gnuT95JaH4Vpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hyi2eNVs/1CFyTz6Ws5AkKp5R1n2bf0v2pWMbg/XfGsPyHaSsFMFVlmuezfJig7smCIq3bFGxqcBhF83x7y4KO/pD0EgMQqZ3bl94MdurEvCbQBg5N7tBuwk1gVWp7xB3oaw2yYbuATG0MaiXm08pUpCrvG+sFokRktdVkqeI40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGQtO9pF; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGQtO9pF"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a5123c1533so1310656f8f.2
        for <soc@lists.linux.dev>; Mon, 07 Jul 2025 02:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751881941; x=1752486741; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXqFqGPfF+AW+wteaTEiwFi6gfdID37R12FXEDON8Cg=;
        b=eGQtO9pFwwIB5e4KmOgQEkkaYmuj41AO82uhM9zdMp7LNcX+BpL6S0EsoBD/LZGUN5
         lMT6A1ZeXk/UIARC9YPPzy/SyFAlWWt5mHh7g6CwbGRwO/LSUcIRksATrr+d/hT+nd1y
         iTR90preEYaQOe0K76h1Q03wnXEuqidY2Y49al5dGCXEmXVgzNG6+DAst3r+kXIf7abb
         41J+to4Mm836cL/Zj9rWEPUPZAeiI64WieyKymGXRT6VLaV5p9VWQxHGNm2EMkxRLXqe
         knIY5U7Hv45w0L/KuNYgU2CfI/NVtOb0qTi5MX5eor7HZOjbJgm0cBbc6BiwAd+7xiDN
         ycSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751881941; x=1752486741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXqFqGPfF+AW+wteaTEiwFi6gfdID37R12FXEDON8Cg=;
        b=d7grRIUREbd+f7zL59ukSfDlE/HCnjBk6s30T3ywBdGedKTSN259To1x1jJ3cEZrHw
         J7/OJ8SkXtRe/szS4smgN1A06mZ2hfa2ihE9YsJGrBsVyFD751t9tajSIBbGwkE7y9GI
         8Y0KcSfkgK4VRDhg4FNm5Z5+9zpYQgZ2cYRHIdcIZZqM304bHQDvnlgljAHARi8p7Vbl
         yAU8uEs34Orp97rFxzKZGVx4rNDa2O4lqlgP+x/digF5dztZiwjzknVgkS+o0Bnge/JC
         YbQJAW5HLE23LVlSUn4d8iEwbJqa++MzhjxEClr1kUSTQBeceSp7XpZa4DXSA2xXNwcW
         ikww==
X-Forwarded-Encrypted: i=1; AJvYcCUUlbOP61XZ2qWy9VN3KVX3e9dqZY01fGjrUvU2ZHZtNKbZYNFGeGH1JcX4zH/1TXnT7Jk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz88MAhz1438RikxqHd2ibab/ZD1Dh2eI03VuJiCgkcOBHD68lE
	1d2VRapOEyJ6s62kq9Y9kPujmWhBYg4zAUtYZWYIhreZpDL06VSaA0sjPnptyQwddoAJB3rpsGe
	bXNgrv/EKkLhGlZLlZtd7p6SeNqydIiU=
X-Gm-Gg: ASbGncsCG7CPiW6aWjt6f/zqn4n0F5wrB4bsrFLUTLG2NdWcp0PLkR5Jg+A56ryhFGN
	nD7AkZAm9fMGFDKOc0FUWjHuBVPeIIln35zJI3r/yl3LXN/AbokhDR5Ce88/Hp4JqzlX2E4Pzp4
	WEEgjxmum6xR092elx/tCb7DV//4yVH+ai2HfDMllmJAmL0A==
X-Google-Smtp-Source: AGHT+IGCWmZhb0r9sYITwhkx4phvDYGw0yLaPOftSXO4F/VMYxZRVNmoGGfSVxUPKVSCtCXeM9hZJCmRyjyHgQZxDpM=
X-Received: by 2002:a05:6000:208a:b0:3a5:2698:f65d with SMTP id
 ffacd0b85a97d-3b4964dedf7mr8113866f8f.27.1751881940919; Mon, 07 Jul 2025
 02:52:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250704081451.2011407-1-ben717@andestech.com> <20250704081451.2011407-4-ben717@andestech.com>
In-Reply-To: <20250704081451.2011407-4-ben717@andestech.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Jul 2025 10:51:53 +0100
X-Gm-Features: Ac12FXzomKy393V9aXimk4vifIzB-hw8ENrGJMrYh6XFujGnzhanbBX2A8ZFbvk
Message-ID: <CA+V-a8tdtRNh6WMV7RUyr4h99o3OqOU1HnajU0t4i7GHFKykTA@mail.gmail.com>
Subject: Re: [PATCH 3/8] dt-bindings: interrupt-controller: add Andes QiLai PLIC
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: arnd@arndb.de, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tglx@linutronix.de, daniel.lezcano@linaro.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	soc@lists.linux.dev, tim609@andestech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 10:02=E2=80=AFAM Ben Zong-You Xie <ben717@andestech.=
com> wrote:
>
> Add a new compatible string for Andes QiLai PLIC.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifiv=
e,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/=
sifive,plic-1.0.0.yaml
> index ffc4768bad06..5b827bc24301 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> @@ -53,6 +53,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - andestech,qilai-plic
>                - renesas,r9a07g043-plic
>            - const: andestech,nceplic100
>        - items:
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
