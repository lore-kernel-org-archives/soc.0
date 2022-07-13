Return-Path: <SRS0=se3b=XS=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED65DCCA479
	for <soc@archiver.kernel.org>; Wed, 13 Jul 2022 08:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC2F7C341CA; Wed, 13 Jul 2022 08:26:07 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 30531C3411E;
	Wed, 13 Jul 2022 08:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 30531C3411E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f172.google.com ([209.85.219.172]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MNss4-1nwEpH41MW-00ODR5; Wed, 13 Jul 2022 10:26:04 +0200
Received: by mail-yb1-f172.google.com with SMTP id p129so18093272yba.7;
        Wed, 13 Jul 2022 01:26:03 -0700 (PDT)
X-Gm-Message-State: AJIora/khOKyRScLWPS+4PV6WtmtIyYcS2g2wvDz70gTU5A0iJucYd1R
	9Eke/deejWr4rR3tEuvXHeaL7T1J2pkD+XvQQTo=
X-Google-Smtp-Source: AGRyM1s5ctXDWESPghTwunvKDjAPfvsYu2kacgrA/MPXviowltYXdPpskedj7zs4LJm1sUX08EXGIUpvgkI0AhSfMmA=
X-Received: by 2002:a5b:b47:0:b0:66e:3617:d262 with SMTP id
 b7-20020a5b0b47000000b0066e3617d262mr2405858ybr.106.1657700762384; Wed, 13
 Jul 2022 01:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220712164235.40293-1-f.fainelli@gmail.com>
In-Reply-To: <20220712164235.40293-1-f.fainelli@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 13 Jul 2022 10:25:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2QrYbWOqV+CG-W0ZkzW6ORgw8R6Dv-L3o2ZAtJs-B3Kw@mail.gmail.com>
Message-ID: <CAK8P3a2QrYbWOqV+CG-W0ZkzW6ORgw8R6Dv-L3o2ZAtJs-B3Kw@mail.gmail.com>
Subject: Re: [PATCH] arm64: Kconfig.platforms: Re-organized Broadcom menu
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, william.zhang@broadcom.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, anand.gore@broadcom.com, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Li Yang <leoyang.li@nxp.com>, Wei Xu <xuwei5@hisilicon.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Matthias Brugger <mbrugger@suse.com>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:vIA/ySl7nsiXcXd5LH2lJqtIsiyCjGejCqOWcve9e86eWzD2JbC
 hWISm2WfHoMk0qqbWjOnKbHFAJSyMrabn5triSwb6TpIubuJIruox5S60z/r4J7r/EAbn/V
 0MIkt8tCHY9KuPVHu/PChCm33jx6jx+tpbVk5YTcSU+2eTM5KoN59I3aUKKKMzAp+18ho3d
 Wn7MNElNvRq+ITVN6dewg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bl9xlGut+e4=:hLil1YlW+OXg8uO4r206Go
 sUeU2/Z+q4WUuW18UL02w+UYXTdmePHdAj242/7S9eRPn3vzt09r2jjd1jfAvmG7Z54JPCCEL
 vktivgGKUVrZ6cvJ/ShWFjKKR/sdi5AfQTHMAdqA4jAYgJ3/CrKv97sv5l6hjXIZKXDCTkX3K
 g7Hdc4zkpUx5DLfEgcb2oBTyhv+/dKNRRHRjDGCQjmlJeNwjN/HGTCQsK2gTMudBg/z6splWY
 5/Xu4U/LJERrcmMSpa4ad4zpN5P/Q5wYGkTsGX4Nn0EHCy0Xf4MtHcUtdME9aqH91N1rX6BCW
 be3jIhkWFLQST2dc9apX7uYCMuumVTYkR+p1bQVFb3hKliVctsmyw0pk0rGOtRCsTbHw+Hts6
 pnHkYiddbYAz4kSd09isglIS+k01/SwmSgV8Q9Z44PdH/rxTwgkl0xsUma4qdQ0zFmxL45SGM
 +xJ6ztf/TY81KCN+EG5J1PfAnSosF11+8ZJ2LL7ziss9XCm6IdCMDSPNnJIOI4CJ05TIYtLTa
 oePnMhveirqGpvI2IPvmsFupTgfxWyNAXq2wGnoWVRhmUA4PxFXv2ripF9sqOqJDqwM+dCuHt
 +hgzpVhFeepNtSRz1HQ07gTUp7Q2OeVl3NQkCemJUbWfK9Wng9jTtQ5bf2DXzoB0CktT7nDL3
 vXzOWEB6ZSapd3V0mtrdZK3rqabd+H1iW8UuJmvwJZtUmUmMPnkLyQKcqYLFW12TzrV14dKIM
 l9xPR3V5maUYIOX6tVlECMtVYBHnJvL4kyU48usv7GoDPtYB2Jr0xyKS7YNmES5a38m96kFep
 32tRovXcO0jBpmkrgYFlJogHTQFqVSDRmjnwWkSgeibeilZoigr7IhY29UTviIJRaRgvlZnwA
 8TrXhj+L1f4dzmZGPNug==

On Tue, Jul 12, 2022 at 6:42 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> There are now multiple Broadcom SoCs supported so group them under their
> own menu such that the selection is visually more appealing and we can
> easily add new platforms there in the future. This allows us to move
> ARCH_BRCMSTB back to its siblings.
>
> No functional changes introduced.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>
> Note this is based on "arm64: bcmbca: add arch bcmbca machine entry"

Hi Florian,

So far, we have tried to keep the Kconfig.platforms file rather coarse-grained,
mainly limiting it to company names and high-level families, but avoiding
sub-menus or adding too many sub-families.

If we add per-vendor submenus, we should probably first decide how we
want to structure this across vendors. I've added maintainers and lists to
Cc for a couple of the ones that are in a similar situation.

I can see a couple of ways we can do this:

a) keep the list of platforms as short as possible, combining related
  SoC families from a single vendor wherever possible, but no sub-menus
  (same as today)

b) Always use sub-menus when there is more than one family, but
   keep relatively coarse platform selection.

c) Use sub-menus and also move to a more fine-grained SoC
    selection, similar to what we have on 32-bit arm.

I would not really want to go to c), but a) and b) both make sense to
me as long as do it consistently across all platforms.

Any other ideas or opinions?

        Arnd
