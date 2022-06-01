Return-Path: <SRS0=62O1=WI=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AF0C433EF
	for <soc@archiver.kernel.org>; Wed,  1 Jun 2022 19:26:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A25BC3411A; Wed,  1 Jun 2022 19:26:37 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 95B36C385A5;
	Wed,  1 Jun 2022 19:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 95B36C385A5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yw1-f171.google.com ([209.85.128.171]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MAxLT-1o7A9Y0nl3-00BP34; Wed, 01 Jun 2022 21:26:33 +0200
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-30c1c9b9b6cso29541027b3.13;
        Wed, 01 Jun 2022 12:26:32 -0700 (PDT)
X-Gm-Message-State: AOAM530+/NG86xtlfb/5/Cz8RPYTzUhYAaqfBgvkpvlsvbLwhD+Ac8HF
	K/OUWv7K7R29WONIC+XG6KA0YGMSgPw0cZw7/gU=
X-Google-Smtp-Source: ABdhPJz0JApbo0Qv67wndhuM17KjFiRygdVF6IoIIcQ65oBNOgfkV7dKkoHQPvHnC/sJqYfjVswl/2RhIyt72lCR3vQ=
X-Received: by 2002:a81:ad7:0:b0:2e6:84de:3223 with SMTP id
 206-20020a810ad7000000b002e684de3223mr1208726ywk.209.1654111591816; Wed, 01
 Jun 2022 12:26:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220601154647.80071-1-pan@semihalf.com>
In-Reply-To: <20220601154647.80071-1-pan@semihalf.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 1 Jun 2022 21:26:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2TXUd6JjSiXSZix1xL+bO-fVAbLWht-zNQV8r_Kn05Zg@mail.gmail.com>
Message-ID: <CAK8P3a2TXUd6JjSiXSZix1xL+bO-fVAbLWht-zNQV8r_Kn05Zg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Add Chameleon v3 devicetree
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de, 
	olof@lixom.net, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	amstan@chromium.org, upstream@semihalf.com, Dinh Nguyen <dinguyen@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eZ4md2S1skx2JYVGAmH+CqP78Xriuox82hDssYEPUfVy4SmsPUx
 F/c7lEmlCsq91fxI9IN6AEyU576Q87Jh+gk68YDA7jTxgr+7wPP1BZzzeM4aEX7TkT35ILE
 RMTMHd5pyRjKfE5ES273Z4LXmctMri9TC3/l8BWiQOO6+D4z4D1TdHHyjkV+Ie6Q9DhsX55
 OxXa/PxLfJ/2BPxynHhQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:orcPm839a3I=:ntg0hBb/NLOq7kUlRBAg2U
 ialoWrSQCm6E3uG6sMupVPrtF5G1VNbarvgJYxEjBxt21HjN4V3zvZHaLTTC3ge6qWTpdjed3
 RCgX9RR07duFrDli4kMmcNG82wp+w0XavfH8IXSmqZFILQz67TbGvTRwcF/vEMRkr0JNT1c/f
 wGI3ISp8nMN2voysIdZ0LRLNHVc9k5bRiDZY2PWSyLhH49DZiK9rwKZijNxZpQsCQoORC6HD7
 xvv8eL0Qw2a1e4keYdRnj0TnQ7wWCh/bRpiaO9ULGzrJO8I5crLoXUBHgHdl33Uyi89aLJQRR
 C2ykUJ7uC52L8n/b4WP7/ESnnUvv2rjPntwREP6BIezRdP0X1AWhF+1WY6fpKsH5Px4haCDb1
 HIb2HraXxutxjRK9e444ChKZaFz8WYF1t8aKlPU0jYKntCTMEUDBb5+qMfUW76/6EHSF3BEZI
 0D1EOVnnyyrvOzadTUrTpdxR2T9YJDqpAxvnUknQCjlmcI//cEQrjZ/XYzOQq14XcWAlA4Tqv
 MSlsdUCZiR3TXInAI4DMzLjdca42+Edb+SFvoQy+qYdo4TXP4v7PSWaHkiPTKQgYsfFkLcuDd
 Z/Xd0+IwRvAC0dUhmWH3OBd8V5XcB9xEYvwr0mZwjeb5VJMuKXiM2EorJh5RwXKjaNdVMfqp9
 MWZgbIh9KIF/QXVFG4qx2/nLWr+iqEnjJKS8/ZWus0yt9UJ8GDXLong4AR1oUG2MTvMQ9w9ni
 /lpmdPiTGHKeDTyqzRpYZcLMWbpkU2WucniwKw==

On Wed, Jun 1, 2022 at 5:46 PM Pawe=C5=82 Anikiel <pan@semihalf.com> wrote:
>
> The Google Chameleon v3 is a board made for testing both video and audio
> interfaces of external devices. It acts as a base board for the
> Mercury+ AA1 module.
>
> socfpga_arria10_mercury_aa1.dtsi and socfpga_arria10_chameleonv3.dts
> have also been sent to u-boot:
> https://lists.denx.de/pipermail/u-boot/2022-May/485107.html
> https://lists.denx.de/pipermail/u-boot/2022-May/485111.html

Hi Pawe=C5=82,

The patches look ok to me, but I think you should be sending them to
Dinh Nguyen for merging through the socfpga tree instead of directly
going to soc@kernel.org.

      Arnd
