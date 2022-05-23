Return-Path: <SRS0=08VO=V7=gmail.com=tmaimon77@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACEBC433EF
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 14:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42966C34100; Mon, 23 May 2022 14:17:54 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51ACEC385A9;
	Mon, 23 May 2022 14:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51ACEC385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id x2so25312363ybi.8;
        Mon, 23 May 2022 07:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wya30f8pr71guQambx1m7tJawwhUNfoR2hqmQ3Ew8Kw=;
        b=VoyHphIe5xAs1WO2PrlGIJ7HPU3+lWmPv8Iv5AXa0sdRCBp6e94HfnWgKIkZd4NMKc
         X/TWlv92Uz/ZK7UYWd4Xb9cwRFfEFbOYbwfeFvWOCZMOiVOeBxHhs/sZareJ+otRkh0N
         3HFVAgKkZhTMEomSk/tWNQKTZLrpyIhubGYltMcgPmb6yhTSgkHozp5vj6V/n3oldmvk
         0GzEgsw+dFLx81rl+gkIZySk4actGtlmiNyatNsJw8RkR6Nlyg4u3E6qalRQkHk/CNND
         J7IBjsa7U8l66WYD4DLpNpz1tQP91KEa8Vz3YiwJqb857VJpGy7d19JaWWmjDDvCZl67
         /KTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wya30f8pr71guQambx1m7tJawwhUNfoR2hqmQ3Ew8Kw=;
        b=6fsy6Jm4pSSlqAWJ6MCaIgjblSMegRksIe5mf+9F0ciJBQqZ+90vKAmUlnt1J3gH4O
         ZRRD3tKIaP7fGy0MjhQ1ikfYVsq7i+XgLYMotNfzruHHnP+Hgnq1FGfZ9m33Z5/7Yy42
         4mJC7Bb3EjwvkD3PZj47oKUMcgVtCFmQMGsl1LnhZX4G4OYbltsFQ6f0Q74Inrer+Mfe
         Q6q6+ZzHb7SLLk5noE9XiSJhHomri3LxT8zwkNycS2ye04ZUKv+5hrzMW9x7dFEejpdk
         P1AUj8HPW6YBD2XL8DYSi7OP0G5mHkxr5rKmxT70g4z6JMasKySvWRRz+cy47myqd4Ow
         3wsg==
X-Gm-Message-State: AOAM530M/MdJdQIj6Vi6Uh9N1vtG9VGWLo4cBg+n+e2MMqNX9S/u2dbD
	xvRd87eWFv9Z9J9yyPmq3e6VdWMKnePClGiqidM=
X-Google-Smtp-Source: ABdhPJwdqjadEd0542LH2dPQevVuNUJmiWPBTbBgQ8Q/FMeciS6rMgCYWIsWTpFl+4cG+ammRNFBiAJAMg+nZOPNKXU=
X-Received: by 2002:a25:b3c3:0:b0:64f:fda2:e394 with SMTP id
 x3-20020a25b3c3000000b0064ffda2e394mr3458257ybf.272.1653315472231; Mon, 23
 May 2022 07:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220522155046.260146-1-tmaimon77@gmail.com> <20220522155046.260146-19-tmaimon77@gmail.com>
 <CAK8P3a1LCkM-w_Oi2qUqgq_Qxsg64uoGg5aaz=X8pBENHBhj0A@mail.gmail.com>
In-Reply-To: <CAK8P3a1LCkM-w_Oi2qUqgq_Qxsg64uoGg5aaz=X8pBENHBhj0A@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 23 May 2022 17:17:41 +0300
Message-ID: <CAP6Zq1j8PEQ2m7rG5YztesiOfXExCr=UMPFhD=Oe+GYDwGP95g@mail.gmail.com>
Subject: Re: [PATCH v1 18/19] arm64: dts: nuvoton: Add initial NPCM845 EVB
 device tree
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Joel Stanley <joel@jms.id.au>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, gregkh <gregkh@linuxfoundation.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Jiri Slaby <jirislaby@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Marcel Ziswiler <marcel.ziswiler@toradex.com>, Vinod Koul <vkoul@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, robert.hancock@calian.com, 
	"nathan=20Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>, Lubomir Rintel <lkundrak@v3.sk>, SoC Team <soc@kernel.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
	LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/alternative; boundary="0000000000006c8ec905dfae8179"

--0000000000006c8ec905dfae8179
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks for your comments.

the patch will modify according to your comments and will be sent in the
next kernel revision 5.19.rc1

On Mon, 23 May 2022 at 12:40, Arnd Bergmann <arnd@arndb.de> wrote:

> On Sun, May 22, 2022 at 5:50 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
> > +/ {
> > +       model = "Nuvoton npcm845 Development Board (Device Tree)";
> > +       compatible = "nuvoton,npcm845";
> > +
> > +       aliases {
> > +               serial0 = &serial0;
> > +               serial1 = &serial1;
> > +               serial2 = &serial2;
> > +               serial3 = &serial3;
> > +       };
>
> > +               apb {
> > +                       serial0: serial@0 {
> > +                               status = "okay";
> > +                       };
> > +
> > +                       serial1: serial@1000 {
> > +                               status = "disabled";
> > +                       };
> > +
> > +                       serial2: serial@2000 {
> > +                               status = "disabled";
> > +                       };
> > +
> > +                       serial3: serial@3000 {
> > +                               status = "disabled";
> > +                       };
>
> Please drop the aliases for disabled uarts. It probably also makes
> sense to have the status="disabled" properties in the .dtsi file and
> only override them when you explicitly want to enable a uart for a
> board.
>
>        Arnd
>

Best regards,

Tomer

--0000000000006c8ec905dfae8179
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+SGksPGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2
PjxkaXYgZGlyPSJsdHIiPlRoYW5rcyBmb3IgeW91ciBjb21tZW50cy48L2Rpdj48ZGl2IGRpcj0i
bHRyIj48YnI+PC9kaXY+PGRpdiBkaXI9Imx0ciI+dGhlIHBhdGNoIHdpbGzCoG1vZGlmeSBhY2Nv
cmRpbmcgdG8geW91ciBjb21tZW50cyBhbmQgd2lsbCBiZSBzZW50IGluIHRoZSBuZXh0IGtlcm5l
bCByZXZpc2lvbiA1LjE5LnJjMTwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90
ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIE1vbiwgMjMgTWF5IDIwMjIg
YXQgMTI6NDAsIEFybmQgQmVyZ21hbm4gJmx0OzxhIGhyZWY9Im1haWx0bzphcm5kQGFybmRiLmRl
IiB0YXJnZXQ9Il9ibGFuayI+YXJuZEBhcm5kYi5kZTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48
YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHgg
MC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0
OjFleCI+T24gU3VuLCBNYXkgMjIsIDIwMjIgYXQgNTo1MCBQTSBUb21lciBNYWltb24gJmx0Ozxh
IGhyZWY9Im1haWx0bzp0bWFpbW9uNzdAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+dG1haW1v
bjc3QGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4NCiZndDsgKy8gezxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgbW9kZWwgPSAmcXVvdDtOdXZvdG9uIG5wY204NDUgRGV2ZWxvcG1lbnQgQm9hcmQg
KERldmljZSBUcmVlKSZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAm
cXVvdDtudXZvdG9uLG5wY204NDUmcXVvdDs7PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAg
wqAgwqBhbGlhc2VzIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNlcmlhbDAg
PSAmYW1wO3NlcmlhbDA7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzZXJpYWwx
ID0gJmFtcDtzZXJpYWwxOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2VyaWFs
MiA9ICZhbXA7c2VyaWFsMjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNlcmlh
bDMgPSAmYW1wO3NlcmlhbDM7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqB9Ozxicj4NCjxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXBiIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNlcmlhbDA6IHNlcmlhbEAwIHs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90
O29rYXkmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgc2VyaWFsMTogc2VyaWFsQDEwMDAgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVv
dDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4N
CiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2Vy
aWFsMjogc2VyaWFsQDIwMDAgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2VyaWFsMzogc2Vy
aWFsQDMwMDAgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCjxicj4NClBsZWFzZSBkcm9w
IHRoZSBhbGlhc2VzIGZvciBkaXNhYmxlZCB1YXJ0cy4gSXQgcHJvYmFibHkgYWxzbyBtYWtlczxi
cj4NCnNlbnNlIHRvIGhhdmUgdGhlIHN0YXR1cz0mcXVvdDtkaXNhYmxlZCZxdW90OyBwcm9wZXJ0
aWVzIGluIHRoZSAuZHRzaSBmaWxlIGFuZDxicj4NCm9ubHkgb3ZlcnJpZGUgdGhlbSB3aGVuIHlv
dSBleHBsaWNpdGx5IHdhbnQgdG8gZW5hYmxlIGEgdWFydCBmb3IgYTxicj4NCmJvYXJkLjxicj4N
Cjxicj4NCsKgIMKgIMKgIMKgQXJuZDxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRp
dj5CZXN0IHJlZ2FyZHMsPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5Ub21lcsKgPC9kaXY+PC9k
aXY+DQo8L2Rpdj4NCg==
--0000000000006c8ec905dfae8179--
