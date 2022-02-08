Return-Path: <SRS0=FMNg=SX=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837CCC433EF
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 07:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46117C340EE; Tue,  8 Feb 2022 07:41:48 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 05E8BC004E1;
	Tue,  8 Feb 2022 07:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 05E8BC004E1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MC3H1-1nTjin1Zi1-00CO0v; Tue, 08 Feb 2022 08:41:44 +0100
Received: by mail-wr1-f50.google.com with SMTP id k18so29047416wrg.11;
        Mon, 07 Feb 2022 23:41:44 -0800 (PST)
X-Gm-Message-State: AOAM533+HqP4lIK+Kmm6uY/jMtSQCSopYFyncdqEloijpiH+oRCUF5+d
	k17wkwl4NFTZvdvEh1SHUKfReu16cIgVHhwO6n0=
X-Google-Smtp-Source: ABdhPJwSN/RUlrPrmkpZbmWEmlsZtj8WZCi5YXxWOOSj9Q39433eqrfugxQNfyVR5WUl9iWtCZ9J5roLsYcDSDBre7Q=
X-Received: by 2002:a05:6000:178d:: with SMTP id e13mr2313626wrg.317.1644306103969;
 Mon, 07 Feb 2022 23:41:43 -0800 (PST)
MIME-Version: 1.0
References: <20211203031332.902485-1-jerry.huang@nxp.com> <20211203031332.902485-2-jerry.huang@nxp.com>
 <VE1PR04MB6477BB08C1AF9F1E5A0B0C1BFE2D9@VE1PR04MB6477.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6477BB08C1AF9F1E5A0B0C1BFE2D9@VE1PR04MB6477.eurprd04.prod.outlook.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 8 Feb 2022 08:41:28 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0dr_Qe47MnuAJSuEPiuzBMfnC_7gDZN0MsUiYE2bqrOg@mail.gmail.com>
Message-ID: <CAK8P3a0dr_Qe47MnuAJSuEPiuzBMfnC_7gDZN0MsUiYE2bqrOg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: Add initial LS1021A IoT board dts support
To: Jerry Huang <jerry.huang@nxp.com>
List-Id: <soc.lore.kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>, "soc@kernel.org" <soc@kernel.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, 
	"krzysztof.kozlowski@canonical.com" <krzysztof.kozlowski@canonical.com>, 
	"linux@rempel-privat.de" <linux@rempel-privat.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"tharvey@gateworks.com" <tharvey@gateworks.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, 
	"jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "dev@lynxeye.de" <dev@lynxeye.de>, 
	"cniedermaier@dh-electronics.com" <cniedermaier@dh-electronics.com>, 
	"sebastian.reichel@collabora.com" <sebastian.reichel@collabora.com>, Alison Wang <alison.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Hqem1Ogya627wNucdp+wyK2gN66G05TCVOb34assf4C+tvLSqz+
 tDQfhEvyul/zctiRKcrqspe7AFTf/X5bsthhSbUA7gYoiU1zYo/iV70a+pLYnqShIYqHAnM
 PCw2xrJntMoB7p1FJQgIao944fR9OsHHkva+3/twiqTu4LDPNPwX9VMShOBfdd6DvbXJrwq
 SeQeMYecc7h5tRMD6ZVIQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OWeiqx+EZYU=:hfRzMxAtv/eGRS3l4bJOG2
 FJ9fmWdGbE2QYEfIRoqBHyAPObrI64h6iqL5GTKsKaq/7txsPnGvQVWQk4s3/AxAlIcAd2+1K
 7Dim5g0sV9HsQ7avGsrqt8ZevdEiGhLMTyBhmXe7Pl0ecmQNN+TZCkHhyygQLJ4YYNs0tBWTA
 9uFJnyEACE+GY39wKlM0rNxOPhGfSPuRjY05RbxZfkcI60VOnGYbXm3yaILoxsfzrOiST33wh
 iQhjecIC5JqkkwfUVdspJbCDU36j1Sdh14SQLIV2o0u4hdty8H71OQb2fKSmyHmkrKNFC9+Q2
 PTZ+bi8iOcbuM+oZz7Kj8x/BD6ZdQANvVxnTROrZgWevpvyMN4DcGVk5x0EH3q6ibJpNiTIJo
 PoPBGckW4OIEPbKgSW5yhY2ALRNoVnBh5bo/Afk5eEFSvzuFqomr0dDOsL71u0ywUNEAwXZQO
 eoW9SZRiJSiqlU/pvguZ+NnRFuM2Hqn5CDDumcc5IV4qpXv0maamWJzbMXQM2sCYha8sad5ov
 XUf4Z5whkAMRLrG6iJuIHcuw6ZkDVLXBtei8j9rhQcmxy8arppQZpPGmzUTbaNPugnzFGv5Zg
 HIYr4GuWnrc/xh2unbXGjN3wXlH+8JDRVmMMGualwPgoc5VSvygtirHRp+PwXFgE2P1/ScPXb
 Z0YFFnu7TaV/7DhCdI83EbdOi0mu2Axx/wT87cgw+C6m2TLEQB8+IcGH0pYdcwHRN2B4Xrp42
 iBj2LcWgAaz4N1p9dNlu16CQH1IDhOjHVKQe+fhNAbUhKj3somft7eI1lYhlB4u545BhTKHbb
 8vttuIUEfHlAHmXhnJsYaREXgp5ktxvW5qmE3g9oh4ZC6nfnGI=

On Tue, Feb 8, 2022 at 2:49 AM Jerry Huang <jerry.huang@nxp.com> wrote:
>
> Any comment for this patch?

Shawn gave a detailed review in December, maybe you missed it:

https://lore.kernel.org/linux-arm-kernel/20211214040228.GD10916@dragon/

         Arnd
