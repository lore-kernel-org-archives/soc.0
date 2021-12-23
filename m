Return-Path: <SRS0=Cg0n=RI=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564AFC433EF
	for <soc@archiver.kernel.org>; Thu, 23 Dec 2021 09:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 38C43C36AEA; Thu, 23 Dec 2021 09:51:17 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86B82C36AE5;
	Thu, 23 Dec 2021 09:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86B82C36AE5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N8XHV-1mN8Gu22Sn-014UlS; Thu, 23 Dec 2021 10:51:13 +0100
Received: by mail-wr1-f54.google.com with SMTP id t18so10291492wrg.11;
        Thu, 23 Dec 2021 01:51:13 -0800 (PST)
X-Gm-Message-State: AOAM533D6Ybbvz/FGJZzDvhKAXX576NrHOCHEGei0MKnbbFtudjqPvw5
	2B+0c29FlfP+222J3BG2rNGzs1zcrnHyAHnWV2c=
X-Google-Smtp-Source: ABdhPJxbiy67vbIKF+PC0Ortg5gYqzho45Ifd8/DY0eRSUq4tS0MenQuAZO8f9A3NCeKMTzXS7GoNge5psxiGbsTnGc=
X-Received: by 2002:a5d:484f:: with SMTP id n15mr1164430wrs.219.1640253073035;
 Thu, 23 Dec 2021 01:51:13 -0800 (PST)
MIME-Version: 1.0
References: <20211223094040.15349-1-vigneshr@ti.com> <20211223094040.15349-2-vigneshr@ti.com>
In-Reply-To: <20211223094040.15349-2-vigneshr@ti.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 23 Dec 2021 10:50:57 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1s7Ekhvwvt0DtndxwkzMwCD-2Y7Va58T_8gDdL0vZNVg@mail.gmail.com>
Message-ID: <CAK8P3a1s7Ekhvwvt0DtndxwkzMwCD-2Y7Va58T_8gDdL0vZNVg@mail.gmail.com>
Subject: Re: [GIT PULL v2 2/2] arm64: dts: TI K3 updates for v5.17
To: Vignesh Raghavendra <vigneshr@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, SoC <soc@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tero Kristo <kristo@kernel.org>, 
	arm-soc <arm@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:YUQm/0BAW4wFFlHutOhAXGCRw6NMqj0VwWBxaJF+kBwjosLq0Ou
 aQmvmMsQLDWv/AA/MU8Nplb+DYxpPlbinX8dYGmREK5MAU6TmTSnuzXOa0SpilYu6K/JSEq
 5m6+Wj1vyZ6f0SUkRiKASySoYcOjvrlVXYklnYLpWz1dUnxmOiLgySlKYn8TtrNjXyVFxjv
 wl9htFi5CwL3WVi8Zni8Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eI7W5rEzyJE=:gYqvIk4YXICizEcHko/z33
 aPTojfcEAf1lpHqGbF5mVt5X51vXaUkgI7JRO1PNQaIXW3UPMlgmWWwpaTM8HL9s9TNnmyzIg
 D36Kv3jU81aG8dyNmS9UVQS0qLzuzcTPMlua9exiOqUVjbhU+SLVgOKfoAon65OmyAdvcyZZn
 zf930SM7fXtX8J5rB4u1bNvVgXth5NWNN4mKYAewJbJx1OaOYLVd1gta5/0/j03CPbkr5kjbZ
 hRwdFRhLF5Q0VbjwhmXuPAqJFiBLQ7DcAZbsORldYmth+blPzb6zAHEwx94pk9v9PNlgjP1Ui
 DpQ1WflbnVRFqd4PX2s0wGHPrjMUMKuyWhMnUIRlLWd2u3jMLAAR9UW+lHBOGsrwR+jZqQ89+
 oSRuvaRBKtbdFoRNKyjORRolo++wjVs34TD5gba8v4y7pZUpb4LOWOwKnemMClmiar7cFtQI8
 e5K9J/ZzsFO8QRv3W8dSCI/p6JP3b2YOP6FxUnKBxZBS5Y3rAjEZnb2nMD+HbBLSZGZ8P03Ok
 5kl/jyQQj+E6N18o1Q6dEQmifvD+uxXMOXDZxJOg0IPgNXw9ilNBg0kPn4qii5V279tbrp5el
 fWYWAyMaDYzJXIeikXpYRQTODIZrSbmU+jo6NZ1c9jM2VqyxnQQzjODOHlrqNQ5o2fGtXlMlS
 JzO+xU8zAhGCHvbp71DUyzIepWJgPbpJca+StOFAsJp8KBgQDtEd6n/qlSMRdXM8Ele4=

On Thu, Dec 23, 2021 at 10:40 AM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>
> Hi,
>
> Please pull the device tree changes for TI K3 platforms for v5.17.
>
> Please note:
> This adds a dtbs_check warning due to missing YAML binding for pinctrl-single compatible.
> There also a checkpatch error for complex macro usage in dt-bindings
> header defining pinmux marco which is harmless.
>
> v2:
> Moved aliases from k3-j721s2.dtsi file and trimmed the list
> as per Arnd's suggestion

Sorry, I should have been clearer about what I asked from you. I have already
pulled the first version of this branch, and a lot of stuff on top of
it, so I can't
easily replace the contents with a new version.

Can you send just patches for the difference between the two versions so we
can apply that on top?

        Arnd
