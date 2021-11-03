Return-Path: <SRS0=qmxZ=PW=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5664C433EF
	for <soc@archiver.kernel.org>; Wed,  3 Nov 2021 16:04:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 909E26056B; Wed,  3 Nov 2021 16:04:50 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCCE960E05;
	Wed,  3 Nov 2021 16:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DCCE960E05
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M7sQ8-1mm8FG0qPq-0052oS; Wed, 03 Nov 2021 17:04:48 +0100
Received: by mail-wr1-f51.google.com with SMTP id s13so4373707wrb.3;
        Wed, 03 Nov 2021 09:04:48 -0700 (PDT)
X-Gm-Message-State: AOAM532k8jwhvUsXstmXyhPhQti3z1ID1VLwTiUiIBniRWRU7ewkAgId
	Hlko4RCl4tPsZskUK+YPPH8aN4mivsCvERSX7p0=
X-Google-Smtp-Source: ABdhPJxBkWvfP3EmDGMtX833YMQlSSUKv+a0bU4ePxoC8shtlPKz7UQHdgSKNT9IU9/Zvyel4u3SU/YK78+sUEUWTN0=
X-Received: by 2002:a05:6000:10cb:: with SMTP id b11mr45324245wrx.71.1635955487857;
 Wed, 03 Nov 2021 09:04:47 -0700 (PDT)
MIME-Version: 1.0
References: <0ea5d885-c770-af56-7de0-bcf6adc61bcd@xilinx.com>
In-Reply-To: <0ea5d885-c770-af56-7de0-bcf6adc61bcd@xilinx.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 3 Nov 2021 17:04:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1qB+UrQTh7FM0mijJ9_=5YHY4JVA17Y0NEsXHAG5DLZg@mail.gmail.com>
Message-ID: <CAK8P3a1qB+UrQTh7FM0mijJ9_=5YHY4JVA17Y0NEsXHAG5DLZg@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: zynqmp: Xilinx SoC changes for v5.16
To: Michal Simek <michal.simek@xilinx.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:zMkJDSRy6gxUbXhhl9ERTvca5aGfvK+Ji0qSsmzwW9pm+FSOFRv
 sIdsB0iXzdlR9fZQcM4VL8BQlZvRzMslIjOt5T27utLIEJhLoQl4I5RQjMq/NpTWyYB30vJ
 8n+eWNdDN6oeLq9RGkJKgDShwlNXScoZzNRiBtDkWOYhZefRdCrdhLtcmIIVK2GCTzhTiOc
 e0re2QH/IvdMyvD9zUXXQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sfbULb5PXG0=:erFtMEX/kUhgQLv/o5a1n1
 VhwwK20oWQQGwTQJZJqQnp1ZiHU/I1ZpUOSjLpV7ts1T3Joit/EEr5xfkWJme5MD6dwrRvggk
 psd77oHIDhoGoDjzw93eWpz8ao9ujRA8TmDy6hfODDu6xRVnNZsvsO0C/Kn9vVy8vTjCfe6mg
 I3EHpFh9Q+7hYSfBPckrLcbnbknFBQO3OCN/gxsUjhD4oz8RqUMKScFoNFirG2GRRS/cKZL6B
 8gmRGDUxSMZiXxcBlwyUv1wK+fJGo8I1sdCMETbAdm/mE2HxiPDWrcuFCjRJG6A1z+EJF4NFY
 r1HaeGzEx1yNM5TwDqbwfFtR9Xrki4hfhCcRGpN44zq+MkZ99Zg9LnXkbKRIM9+y1bSWRV3Xe
 pH9mv98F4xaMkeGQwaro+CyX3pIuUD4QKGbAgtQNCrT4JIkG5/XFcZpO7k3gZgkXDzAnEkTu1
 EU7zEH9KydPcXJK0sDdnholmEpyfau2Mx9UYnslLbCPS7d7CcnJUHP2NPRX4d6F4oBm6LpC8n
 gYqpqBL7rkIEYNv2HyPH63YHrGB7wKo4mujJi7X3azLJvd/bKbpjDAzqMh4Xpjj0F3TekpxDT
 8TdF38ErccC5wa68HFF15XEHMoQ2pyt/YLI550zsRh6onjQI1waCPA6Q7f9pboe9FqT7aKpDl
 hdWR6oPRV+wltYt0L+QzYzmYbjskN9FS3SLGImcwSTzVacebFAiBMReTlZNW9UO3Px5I=

On Fri, Oct 29, 2021 at 8:24 AM Michal Simek <michal.simek@xilinx.com> wrote:
>
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
>
>    Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
>
> are available in the Git repository at:
>
>    https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-v5.16
>
> for you to fetch changes up to 4e2dfd51f7ff81ebd2538243ee8c20bcba898864:
>
>    firmware: xilinx: check return value of zynqmp_pm_get_api_version()
> (2021-10-18 15:13:02 +0200)
>
> ----------------------------------------------------------------
> arm64: dts: ZynqMP SoC changes for v5.16
>
> - cleanup and fix PM_INIT_FINALIZE
> - check return value of zynqmp_pm_get_api_version()
>

None of this seemed urgent enough for a late merge, please rebase once
5.16-rc1 is out and submit for 5.17.

If any of the patches here fix bugs that a user might encounter, please
send those as a fixes branch for 5.16.

      Arnd
