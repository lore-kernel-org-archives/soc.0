Return-Path: <SRS0=qJwL=ER=gmail.com=zhoubb.aaron@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EBDCA0FE6
	for <soc@archiver.kernel.org>; Fri,  1 Sep 2023 09:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5311AC433CA; Fri,  1 Sep 2023 09:27:42 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 66287C433C8;
	Fri,  1 Sep 2023 09:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 66287C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6bc9254a1baso1340742a34.2;
        Fri, 01 Sep 2023 02:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693560460; x=1694165260; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNejtY2CYRQHuWNnMRsL970fJ2LcYenjaMg4E67qwZg=;
        b=OVi2G/eXlMLM+Rn4B33x6uy2Z/fiWdQChxQhfO1BnNWpvnG/KwhAYcLGohJPQ1dxhN
         HlJQ7Xz+lMtwbFFfWCuJxkt2ArQ+mqEHamDqquYAXm9QPVpb3GZjvrd5KFB8Z0Qbpwm9
         dtwowBfI0s0b3VMH0sDEhtLGlfF7a24fA84fm9htsLDgU4XbF2Vyuz3ttqfwIf5eQmgE
         DpdubcKbq84DkHJpPgkjBJIJxbGZSuvOswrhLTgibju6qLZW/O99wfBgsQTHYivxShBP
         UKhLX08v17qGHC/0N3ES4Rflqus+LHyb/oyUT3P2ZnqUIZzGtM2c5sg2m2bbM4mrgEeT
         2W5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693560460; x=1694165260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nNejtY2CYRQHuWNnMRsL970fJ2LcYenjaMg4E67qwZg=;
        b=SlDJEhaEWB+rGmLeE+uVfrewNEZoBeqY4eOgn43v+cL7yjKNL66NV4DJ4FKAI4643C
         qsfhwCs9xxjGQYBBENAjiltemnNBWn8Sj9okl0kgbBa6zQ8DZh55pzCq0KlXDXr/atKv
         8GSr7Zmta0Glq+tQkIBc0s7cDWcR+JopOOil14CgGUFHD/Jqz25lI4u7Yz4iwzd6caCl
         hRNsaUcKqYfg+KDaA2EPMBf6TY0QSI5n0YMHKDbiiRun3aZZYmW6qO0OpQ9aVfwHvRUz
         KSruxFDc/FOQN657yjPQ0cCJUax/jVEPWNYiMA0v+kys4O6km0B/UfJ6Qf/PzgaF0pc6
         I9bQ==
X-Gm-Message-State: AOJu0YyIWq/GMJhNw2hAFWdsqn1RnQIvUOBwh91WwWKjjoLY3ZHA+f7K
	qRARGSo/bqlS7P5neTRdjevCPpTRaMgehI8EY3Q=
X-Google-Smtp-Source: AGHT+IHGcKLODahchCBBvFixtlLSYCgY2KNa3x1lSet1wv+1MdRrmY04593geKiUioPkoJbLl9x3eu52b/hIFO0+TyY=
X-Received: by 2002:a05:6358:342a:b0:133:428:35dc with SMTP id
 h42-20020a056358342a00b00133042835dcmr1444953rwd.11.1693560460156; Fri, 01
 Sep 2023 02:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693474728.git.zhoubinbin@loongson.cn> <38e811816c37a2d52374fa04864654ff1e9b4dc8.1693474728.git.zhoubinbin@loongson.cn>
 <cfa55813-946e-7aad-b7a4-54450a1ea5d5@linaro.org>
In-Reply-To: <cfa55813-946e-7aad-b7a4-54450a1ea5d5@linaro.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 1 Sep 2023 17:27:28 +0800
Message-ID: <CAMpQs4Jrvd=KAXUBYYdixvvhBx1hAXxECUhGVsuEED1Jp9SPDA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] dt-bindings: soc: loongson,ls2k-pmc: Allow
 syscon-reboot/syscon-poweroff as child
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, soc@kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof:


On Fri, Sep 1, 2023 at 5:06=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 31/08/2023 13:43, Binbin Zhou wrote:
> >  required:
> >    - compatible
> >    - reg
> > @@ -54,4 +66,18 @@ examples:
> >          interrupt-parent =3D <&liointc1>;
> >          interrupts =3D <11 IRQ_TYPE_LEVEL_LOW>;
> >          loongson,suspend-address =3D <0x0 0x1c000500>;
> > +
> > +        syscon-reboot {
> > +            compatible =3D "syscon-reboot";
> > +            offset =3D <0x30>;
> > +            mask =3D <0x1>;
> > +        };
> > +
> > +        syscon-poweroff {
> > +            compatible =3D "syscon-poweroff";
> > +            regmap =3D <&pmc>;
>
> ???

I did notice that commit [1] changed "regmap" to "unrequired" for
"syscon-reboot", but "syscon-poweroff" did not do the same.
So, at least under the current "syscon-poweroff" rule, "regmap" is "require=
d".

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/power/reset/syscon-poweroff.yaml?h=3Dv6.5#n4=
1

I had my doubts before, but seeing that some dts do have
"syscon-poweroff" as a separate node, I assumed there was a
difference.

commit[1]: 2140d68d69d4 dt-bindings: power: reset: Unrequired regmap
property in syscon-reboot node

Thanks.
Binbin
>
> This is a friendly reminder during the review process.
>
> It seems my previous comments were not fully addressed. Maybe my
> feedback got lost between the quotes, maybe you just forgot to apply it.
> Please go back to the previous discussion and either implement all
> requested changes or keep discussing them.
>
> Thank you.
>
> Best regards,
> Krzysztof
>
