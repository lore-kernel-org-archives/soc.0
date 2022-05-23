Return-Path: <SRS0=4JMP=V7=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3FFC433EF
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 12:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 76051C385AA; Mon, 23 May 2022 12:36:36 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 280B4C385A9;
	Mon, 23 May 2022 12:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 280B4C385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f181.google.com ([209.85.219.181]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1My3In-1ne1kt2hgN-00zTIb; Mon, 23 May 2022 14:36:32 +0200
Received: by mail-yb1-f181.google.com with SMTP id v71so25119681ybi.4;
        Mon, 23 May 2022 05:36:31 -0700 (PDT)
X-Gm-Message-State: AOAM5319y3fJEalD148CR+OK+F1Mnxqfu/8f3KG/Z6JkKIj8u9mfmv+q
	cd52mIcU86UfbqrcmqIfosVszIT2w5uyfZUg3wo=
X-Google-Smtp-Source: ABdhPJxpUCa94Kh6HQKuK56biKlb3vDJKuICvFZFBgpVEpCuri5EfGLbRA6cBhu22Na5oqGEdTcIEn9+H34udGZY6o0=
X-Received: by 2002:a25:75c5:0:b0:648:dccd:e1c with SMTP id
 q188-20020a2575c5000000b00648dccd0e1cmr21094709ybc.452.1653299785602; Mon, 23
 May 2022 02:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220522155046.260146-1-tmaimon77@gmail.com> <20220522155046.260146-5-tmaimon77@gmail.com>
In-Reply-To: <20220522155046.260146-5-tmaimon77@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 23 May 2022 11:56:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0Nh4m7O_WPe1DTWqwWU32C5khOPH0ir7r_=s106mLv5A@mail.gmail.com>
Message-ID: <CAK8P3a0Nh4m7O_WPe1DTWqwWU32C5khOPH0ir7r_=s106mLv5A@mail.gmail.com>
Subject: Re: [PATCH v1 04/19] tty: serial: 8250: Add NPCM845 UART support
To: Tomer Maimon <tmaimon77@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Joel Stanley <joel@jms.id.au>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, gregkh <gregkh@linuxfoundation.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
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
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:kHwhk8UnEQsU/Q0W19w66pgNVBQTZxO1WsiGadZ8K0ogWe8vILK
 Hb5OpZ+kBBKflulNQJ+SIFdbFeh1f/C4Mq0tZPDVAtg5N1BRU1sdmT1euENwuErFLMTo35i
 wXpvMUQNMexxhoFBjoE1rnaH8yoqJLaXSJQ12Hzuig/1Q1OCF2vz6UFrUPyrW+n6UfPFbh4
 HZtp6EA30AavEnu27k9xA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VFsV8Vc1KdY=:kv1z/EGVKid4Qw+25KNTs+
 +5x8prqVwrf/1A490dpO7NMEhMuU8/W1zN09uLQY7DMELseqnjKrMAp31DoovrsfdK3zQCOKc
 YYmefJ9QrwrA+mwWpFGlG5qWcZTcE7Bk73ZJiONmkENGMTcSrkYQ4esy9pUqMSrUF9HDqW2aO
 5j91qOqt6GFZgoe+rg9/xecXwVDpK81L/g7DuzuRnjB1UM5lMO0EbFlzyHLBSc1tA/qTibf7/
 X94lYJ1JLEYDGvqV2VZd2lbo8RRHdLkLAH36JY/Da3vPg76fiRCDoNCo/uIX7khFsOC5AhZss
 qdnXb1nUImtICl3eXMT+1ulO/YnsPAUiHXS0hZU/EWPLfNpBoGAy++aPjRTzQ+F7tIPWT9gzt
 oP2EJxE9H6t+WH3q8gKDl57MxRRwvbwzQaDF9o7cTbbf4krkSfEI3sa9/dQnAW3YKe49MF9pD
 idN952sHKn+HU/XWG5quA0D/qUsL3KiuqfP5htdq6KelXFv70FXgXPTjjFSLw5V8irnZPnICx
 PKGr+wqyQXVA/3wSXhB1C+06ulVxmUMLPBhCKPFWSBESXgKss/Mgr6SaxXWFJ9pcDDBwGkI+u
 NSHLz9xG+XSZQV0t6vecJyQ8s6iHEMJPWlGO4PrKlFjgAUKl2nAmLUfuVf8TJuvSyKWHKd6TS
 M8VOvugwn4LgwuegB1rsUt/NoGDZyLTlNgPJJo1Kl8QCpKxro4qPdwE7dHWKGc5a7Ggnyhh/J
 9auYvEH/jIZQhPooiLyYhETV5p/oml8HLM8rC5z9Zt9dUcBJLyibX2DiuYFA02c4su43bEOXt
 JZAQ0yVJee0lgj2IoPsb+5r/yXnqA78CwgfKC8S1Fq6vCJZrQDVsWsTMLICaOfLgVWC6ns/Oq
 TL819Zex+kFoN8bVJhqOGzS7vSF8nvUjnWWIJeflk=

On Sun, May 22, 2022 at 5:50 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
> +++ b/drivers/tty/serial/8250/8250_of.c
> @@ -333,6 +333,7 @@ static const struct of_device_id of_platform_serial_table[] = {
>         { .compatible = "ti,da830-uart", .data = (void *)PORT_DA830, },
>         { .compatible = "nuvoton,wpcm450-uart", .data = (void *)PORT_NPCM, },
>         { .compatible = "nuvoton,npcm750-uart", .data = (void *)PORT_NPCM, },
> +       { .compatible = "nuvoton,npcm845-uart", .data = (void *)PORT_NPCM, },
>         { /* end of list */ },

If these are compatible devices, it's usually easier to claim
compatibility with both the specific chip and the older model
as a fallback, to avoid driver changes. This seems to apply to
the timer and watchdog devices as well.

       Arnd
