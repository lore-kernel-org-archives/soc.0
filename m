Return-Path: <SRS0=EptG=OB=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824D5C433F5
	for <soc@archiver.kernel.org>; Sat, 11 Sep 2021 02:49:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 59B7961214; Sat, 11 Sep 2021 02:49:54 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4405610C9
	for <soc@kernel.org>; Sat, 11 Sep 2021 02:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4405610C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-qt1-f171.google.com with SMTP id u21so3338533qtw.8
        for <soc@kernel.org>; Fri, 10 Sep 2021 19:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+o5xXlMyaRYPM6ro5/rEDv+XYSDbuwfD76xQEMPw9C4=;
        b=qH/5sdQLbxTl0E+9A685zLUzFO43zCTJC8nSqLO5r4SO8y4e8hnR2bqdWbQfnTMQ/h
         xTtmtef8Y4uaVt8MTodHQR3Knpb3d/DbPdykN/YMTVl3g0hBBGsS0SCv5U/p20NckisU
         FS7md3Bz3IiZLwUIgKWRpV9Z6iuEfCgYEmMWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+o5xXlMyaRYPM6ro5/rEDv+XYSDbuwfD76xQEMPw9C4=;
        b=cuXPwHBPvLYgGF4npqJXy3zFidrMU8FxRi80xjqvc2ll8t3glutCJ7jlBPx9JDkEJG
         m4qLZOOqtfzhUCt/WHX6i/ippw5ZvWX3H0I2x0ib//f2suX1ibkd/VtIoxTBBhl9gzhU
         VK5E6eL7wl5I3kSvtVW/m8wO30NsX898SJhRgevP+FIxNERPIfe7awz179mMJoOsmk3E
         rASEGzMAML94twE5/Q9ZHfLfcAgy3+RPbdygHu2IP3caOxFjc9TojwkgmlaopGa2ktwR
         xXyaCDzTAxyIfJAs7c0xkc+KE44RaFnpc64ke81t6QZXPyfcDUWQFEEowiE/F1Elnit+
         b7tg==
X-Gm-Message-State: AOAM533jacmzxP4BLZy4V+CzH9OBPL5yO338jXurn6pl3XdkEARrWNEj
	LGBdgHxkWNR1cYGZlimYm1Hh3bLmibJFbsgnzBdBzA==
X-Google-Smtp-Source: ABdhPJyDGuEGrEIVVnbtqt915VLr0esTLUyCejPZaBpIGvPWEjTvJFQ7RAqTdeIUlory+0c5gi1QlX1yiUvuFShLvOM=
X-Received: by 2002:ac8:5a13:: with SMTP id n19mr620420qta.380.1631328592893;
 Fri, 10 Sep 2021 19:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210910190322.27058-1-romain.perier@gmail.com> <20210910190322.27058-4-romain.perier@gmail.com>
In-Reply-To: <20210910190322.27058-4-romain.perier@gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 11 Sep 2021 11:49:42 +0900
Message-ID: <CAFr9PXmx9kE+RM2uVS2Wjb2zjrz_PyepZvbwHhGath=wV3btGQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: add vendor prefix for Wireless Tag
To: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	SoC Team <soc@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/alternative; boundary="0000000000004aaec405cbaf4911"

--0000000000004aaec405cbaf4911
Content-Type: text/plain; charset="UTF-8"

Hi Romain,

On Sat, 11 Sept 2021 at 04:03, Romain Perier <romain.perier@gmail.com>
wrote:

> This adds a vendor prefix for wireless tag boards and SOMs.
>
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index a867f7102c35..b50d62dde7c5 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -517,6 +517,8 @@ patternProperties:
>      description: International Business Machines (IBM)
>    "^icplus,.*":
>      description: IC Plus Corp.
> +  "^wirelesstag,.*":
> +    description: Wireless Tag (qiming yunduan)
>    "^idt,.*":
>      description: Integrated Device Technologies, Inc.
>    "^ifi,.*":
> --
> 2.33.0
>

This should be in alphabetical order.

Thanks,

Daniel

--0000000000004aaec405cbaf4911
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Romain,</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Sat, 11 Sept 2021 at 04:03, Romain Perie=
r &lt;<a href=3D"mailto:romain.perier@gmail.com">romain.perier@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thi=
s adds a vendor prefix for wireless tag boards and SOMs.<br>
<br>
Signed-off-by: Romain Perier &lt;<a href=3D"mailto:romain.perier@gmail.com"=
 target=3D"_blank">romain.perier@gmail.com</a>&gt;<br>
---<br>
=C2=A0Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Docum=
entation/devicetree/bindings/vendor-prefixes.yaml<br>
index a867f7102c35..b50d62dde7c5 100644<br>
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml<br>
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml<br>
@@ -517,6 +517,8 @@ patternProperties:<br>
=C2=A0 =C2=A0 =C2=A0description: International Business Machines (IBM)<br>
=C2=A0 =C2=A0&quot;^icplus,.*&quot;:<br>
=C2=A0 =C2=A0 =C2=A0description: IC Plus Corp.<br>
+=C2=A0 &quot;^wirelesstag,.*&quot;:<br>
+=C2=A0 =C2=A0 description: Wireless Tag (qiming yunduan)<br>
=C2=A0 =C2=A0&quot;^idt,.*&quot;:<br>
=C2=A0 =C2=A0 =C2=A0description: Integrated Device Technologies, Inc.<br>
=C2=A0 =C2=A0&quot;^ifi,.*&quot;:<br>
-- <br>
2.33.0<br></blockquote><div><br></div><div>This should be in alphabetical o=
rder.</div><div><br></div><div>Thanks,</div><div><br></div><div>Daniel=C2=
=A0</div></div></div>

--0000000000004aaec405cbaf4911--
