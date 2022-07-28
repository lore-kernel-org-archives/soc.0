Return-Path: <SRS0=ZCVf=YB=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C59C04A68
	for <soc@archiver.kernel.org>; Thu, 28 Jul 2022 09:09:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E7D1C433D6; Thu, 28 Jul 2022 09:09:32 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E830C433C1;
	Thu, 28 Jul 2022 09:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4E830C433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-ej1-f45.google.com ([209.85.218.45]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N0WLC-1nVkah3IyS-00wYQW; Thu, 28 Jul 2022 11:09:27 +0200
Received: by mail-ej1-f45.google.com with SMTP id ez10so2024237ejc.13;
        Thu, 28 Jul 2022 02:09:27 -0700 (PDT)
X-Gm-Message-State: AJIora9AJDDWDxk8FwbxocLijQvgsGlJssPOsB5b0WtS3/T4vg3Sw5YJ
	6THq9U2HVyHJ2XpRzvkSduf1qOc6T79N6y0E6Ew=
X-Google-Smtp-Source: AGRyM1vDhbiuler73u+EjIx5wuxh8QlQQ0Haec12VYGBn4ZX1iE5CsXRYzT6tT02rH/oGeGfxWWYg85bgZqyR1cqrd4=
X-Received: by 2002:a17:906:dc89:b0:72f:1d4f:cea8 with SMTP id
 cs9-20020a170906dc8900b0072f1d4fcea8mr21214622ejc.654.1658999367339; Thu, 28
 Jul 2022 02:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <1658681004-132191-1-git-send-email-john.garry@huawei.com>
 <CAK8P3a0umWWic6LAzxXJ7BACYVE--m-wbynh7Z8F+pGoUBxGTA@mail.gmail.com>
 <25237c44-ebc4-fc9a-7c6f-3e990f968038@huawei.com> <CAK8P3a2+0EwSJ=fRBL2JCGypJRL-qE4rEiXYnJbqhZ=weethdQ@mail.gmail.com>
 <b39bf8c4-c702-8f49-12aa-d3ac05889b80@huawei.com> <CAK8P3a0w+_MLOjJAKMENe6MYvBcXWXSir47Hz34WbtdEeAmaBw@mail.gmail.com>
 <4d010f40-6c4c-32c7-2772-1bbfa02c03b7@linaro.org>
In-Reply-To: <4d010f40-6c4c-32c7-2772-1bbfa02c03b7@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Jul 2022 11:09:11 +0200
X-Gmail-Original-Message-ID: <CAK8P3a38uGGGLA4b2bi=v8cV6-dH5yEcvBYcwr5ChzkwMTX9_Q@mail.gmail.com>
Message-ID: <CAK8P3a38uGGGLA4b2bi=v8cV6-dH5yEcvBYcwr5ChzkwMTX9_Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64 defconfig: Get faddr2line working
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, John Garry <john.garry@huawei.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>, 
	SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:zLp8J7qqCrjs33vbBVHV3b+M246OSmLrTrADa2KE08Gf8DjsyxT
 +kmUFu5/rxrQX4yQrR2gSOFv4pR7M3XuNF8tEJBWglSPJ63aZasSfy/GURjwL2mYS0u8/Q8
 s2eU6tWA/dHw4JOOQuvyqwAqIqdS4JTR6iugUomrTIn2Et4prhFKVJzwBSj95zc6WB4s3mw
 HEneQut7jkMyGZGkn01XA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XlOWMZXjuKo=:8bh5cdNVi4jJOyssl7KtxH
 wd9Ck945WR3FWGDYyLUFB9uRKwzX135wLgC00JpiKxUFbbVicuwxZcirhTJ8oT7pWnUlIGKgU
 GzAEN+pOEMUR+Y10nMF08V+3cmUT0MlSFJB/SiKF4hVNwmFGN+jvr602Iu6leqsczu2hvAn8X
 36AUm1aRPMC3uKdWZXXNjIL4vBrILX0osej5UrCIMgkWs3TQpD7+0LDqpGbw2e3EfLfN4kNJl
 7fktL2V2enkUWkdBtSiXvRhst+6E56s/Uydsm0NNd1L0v5beH1L6LmOV1f1E7KM613BCPAP53
 BqqQhtvTQ9hbQHmtn0wwMtUUBWtj1C5qyu7I/bMwyu2bcOQ0bcgk9uc5LvB0CjdMecVyQ99iE
 ORfRD5iqgkCNackqM+qRbc4GGVNkKvakxDIlmQEML5+X+BDZ8AXhIpjl936sCmE71xt5kq16y
 bGgJwRCEq6DTR9qgW+AYUC4kPfBCG6owif+w5ateQ3seMBJtI8GItttFmHo6Yp1ubuWiNzyNA
 9gpaz7OnRmIHtIiBEbHs5ysVmOUxeM2YAn5DAxXsRd1HQThvRmWlDScLlA9ApUS99b6s0um4s
 msvsAdqvZS88wndQmLPif+u6jq6dAeWgTdl7L8IstJQ/IjCrSDb87uInxq4PqiUYLGS0o1bcV
 TBY+A9gggUft9CrPMgCqgcPi0Fc0KbdK9qA4PWPrmWwOF+NpDPSL6MQCNCqP7faJIK3XMDiaK
 9WwA1/ySutK0q13Ov8MCrk6Zv15M1FOk9QSmchFHc1yLTwgysmmyTN2RATwHwucyAGul7NFUQ
 rOaRdLJAIqQ/ENIJXiMcWCjN999+kgc2kvzk4swNLqjPBAkcmggbttkN1xC4z5OnzLCHJCYh+
 akWFej87txbDJigD3XoQ==

On Thu, Jul 28, 2022 at 10:53 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
> On 28/07/2022 09:23, Arnd Bergmann wrote:
> > On Thu, Jul 28, 2022 at 10:06 AM John Garry <john.garry@huawei.com> wrote:
>
> As we are using a common driver for this, we wanted to check if the
> parent was a slimbus or not, to be able to select correct read/write
> interfaces.
>
> rethinking about this approach, It should be doable to also derive this
> information from compatible strings, Soundwire controller versions 1.3.0
> and below are always of type 1 and the newer ones are type 2.
>
> So this could get rid of IS_REACHABLE check along with references to
> slimbus_bus from driver.

Referencing slimbus_bus here is not a problem, just use IS_ENABLED()
and fix the dependency. While at it, please also

> expressing the SlimBus dependency for type 1 should be either captured
> using imply SLIMBUS or depends in Kconfig.

'imply' has no effect on compile testing, it only affects what goes in
the defconfig file, so there has a be a 'depends on'. To allow building both
with and without slimbus, but disallow the configuration with slimbus
as a loadable module and soundwire-qcom as built-in, do it like this:

diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
index 2b7795233282..69e46cce7d8b 100644
--- a/drivers/soundwire/Kconfig
+++ b/drivers/soundwire/Kconfig
@@ -35,7 +35,7 @@ config SOUNDWIRE_INTEL

 config SOUNDWIRE_QCOM
        tristate "Qualcomm SoundWire Master driver"
-       imply SLIMBUS
+       depends on SLIMBUS || !SLIMBUS
        depends on SND_SOC
        help
          SoundWire Qualcomm Master driver.
diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 22b706350ead..f65c7737c2db 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1289,11 +1289,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
        data = of_device_get_match_data(dev);
        ctrl->rows_index = sdw_find_row_index(data->default_rows);
        ctrl->cols_index = sdw_find_col_index(data->default_cols);
-#if IS_REACHABLE(CONFIG_SLIMBUS)
-       if (dev->parent->bus == &slimbus_bus) {
-#else
-       if (false) {
-#endif
+       if (IS_ENABLED(CONFIG_SLIMBUS) && dev->parent->bus == &slimbus_bus) {
                ctrl->reg_read = qcom_swrm_ahb_reg_read;
                ctrl->reg_write = qcom_swrm_ahb_reg_write;
                ctrl->regmap = dev_get_regmap(dev->parent, NULL);
