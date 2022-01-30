Return-Path: <SRS0=l1D7=SO=broadcom.com=arend.vanspriel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B249DC433F5
	for <soc@archiver.kernel.org>; Sun, 30 Jan 2022 12:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 734ECC340E8; Sun, 30 Jan 2022 12:57:09 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D23B4C340EB
	for <soc@kernel.org>; Sun, 30 Jan 2022 12:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D23B4C340EB
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pj1-f48.google.com with SMTP id q63so11091780pja.1
        for <soc@kernel.org>; Sun, 30 Jan 2022 04:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:date:message-id:in-reply-to:references:user-agent
         :subject:mime-version;
        bh=Bg5HAhIfYTw6NqcTzxDB/F6COD/wEn3+XpizdrMDKp4=;
        b=Np7bPobQph0+aPGe7NeBW5qWw4whHoSW+/D9KdR+X7EKP6JcAGkJWBmprpy9jz2YBK
         PmbvjPks+jJSqc/54SAUmy7HMrDYjpGxYKYOwndczilpnAApTKto32mo4N31KgSYHWSV
         j7pVizTSxynm+9ixQ52rTsIv8Xtn1Or4Ys6Zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:user-agent:subject:mime-version;
        bh=Bg5HAhIfYTw6NqcTzxDB/F6COD/wEn3+XpizdrMDKp4=;
        b=5A/o7Lxjwwkaps9B0UHKFsUTZIqY6N2dTxEjF2O0psQZI4H0etU2kqrcQqLbHs33DH
         zDj2ZHv4BgQ9oUFJntMNFJPqXixgJXiBK7gA6UQRqqGSN3GGW5zEwkh8JiV4jOoLRtlo
         J/Qt5MpYkBAt39oP9TzyOJxYv+J1ZOOzQ2fnpL0PWy57jMoA7Gz6vOqitNnGJKe1z6S0
         gS/H8oCafYLeD4kuC1svB9FKDbZu5YdBEvMnKCu6trRPa+GYmWwJYU8fkKBtyZ3ejT5K
         lV6hE0P7t0bpFF9h8U5HI91slZtgHLqFR1BiPXEQ6dbQU0UQmN1pIMQ2A+TuTuGs7sDx
         fsAg==
X-Gm-Message-State: AOAM531Z5+Q0PWjtOd8EYqixOuI4jJ64wl9Q4W9y/0uBVwPV2QzAixsu
	aIewvOErf2t3cHrdfsRPpg4Jig==
X-Google-Smtp-Source: ABdhPJw9kFCZGzbEgJdhW8fmYmwG6VRf5OaMgt32OS+39DwTdkcVGMA6AyLEJhkfEdHB6TVzFIUWSA==
X-Received: by 2002:a17:90b:4b4a:: with SMTP id mi10mr19111682pjb.103.1643547427089;
        Sun, 30 Jan 2022 04:57:07 -0800 (PST)
Received: from [192.168.178.38] (f140230.upc-f.chello.nl. [80.56.140.230])
        by smtp.gmail.com with ESMTPSA id d20sm16140316pfv.74.2022.01.30.04.56.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Jan 2022 04:57:05 -0800 (PST)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, Arend van Spriel <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, "Chi-hsien Lin" <chi-hsien.lin@infineon.com>, Wright Feng <wright.feng@infineon.com>, "Chung-hsien Hsu" <chung-hsien.hsu@infineon.com>, Kalle Valo <kvalo@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Phil Elwell <phil@raspberrypi.com>, <devicetree@vger.kernel.org>, <soc@kernel.org>, <linux-arm-kernel@lists.infradead.org>, <linux-wireless@vger.kernel.org>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-rpi-kernel@lists.infradead.org>
Date: Sun, 30 Jan 2022 13:56:57 +0100
Message-ID: <17eab0f59a8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <aa3c8cfc-39bf-22e4-cb98-c19c14e7d8bc@i2se.com>
References: <1641068812-5851-1-git-send-email-stefan.wahren@i2se.com>
 <1641068812-5851-2-git-send-email-stefan.wahren@i2se.com>
 <8ed4450d-85d9-c69b-761a-7695b3f1bbb3@i2se.com>
 <dff5f86f-d6a5-f197-3c90-3b77d06991ce@broadcom.com>
 <aa3c8cfc-39bf-22e4-cb98-c19c14e7d8bc@i2se.com>
User-Agent: AquaMail/1.33.0 (build: 103300102)
Subject: Re: [PATCH RFC 1/4] brcmfmac: use separate firmware for 43430 revision 4
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000979e3d05d6cc34db"

--000000000000979e3d05d6cc34db
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

I am also a bit confused. The subject mentions revision 4, but your log 
shows 43430/2. Took some digging but found that numerical rev 2 matches 
'b0' and rev 3 matches 'b1'. The BT part is unknown territory for me so can 
not clarify things there.

Regards,
Arend

On January 30, 2022 12:35:35 PM Stefan Wahren <stefan.wahren@i2se.com> wrote:

> Hi Arend,
>
> Am 24.01.22 um 10:43 schrieb Arend van Spriel:
>> On 1/22/2022 1:35 PM, Stefan Wahren wrote:
>>> Am 01.01.22 um 21:26 schrieb Stefan Wahren:
>>>> A separate firmware is needed, for Broadcom 43430 revision 4. This
>>>> chip can be found on e.g. certain revisions of Raspberry Pi Zero 2 W.
>>>> Original firmware file from IC vendor is named
>>>> 'brcmfmac43436-sdio.bin',
>>>> but brcmfmac and also btbcm drivers report chip id 43430, so requested
>>>> firmware file name is 'brcmfmac43430c0-sdio.bin' in line with other
>>>> 43430 revisions.
>>>>
>>>> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
>>>> ---
>>>>
>>>> Hi,
>>>> i'm not sure about all these mappings. All i can say is that the wifi
>>>> interface of the RPi Zero 2 cames up with this patch.
>>> gentle ping (yes, i'm aware of the merge window)
>>
>> Sorry, Stefan
>>
>> Should have seen this earlier, but here it is....
>>
>>>>
>>>>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 4 +++-
>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
>>>> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
>>>> index 8effeb7..c79bd47 100644
>>>> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
>>>> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
>>>> @@ -618,6 +618,7 @@ BRCMF_FW_DEF(43430A0, "brcmfmac43430a0-sdio");
>>>>  /* Note the names are not postfixed with a1 for backward
>>>> compatibility */
>>>>  BRCMF_FW_CLM_DEF(43430A1, "brcmfmac43430-sdio");
>>>>  BRCMF_FW_DEF(43430B0, "brcmfmac43430b0-sdio");
>>>> +BRCMF_FW_CLM_DEF(43430C0, "brcmfmac43430c0-sdio");
>>>>  BRCMF_FW_CLM_DEF(43455, "brcmfmac43455-sdio");
>>>>  BRCMF_FW_DEF(43456, "brcmfmac43456-sdio");
>>>>  BRCMF_FW_CLM_DEF(4354, "brcmfmac4354-sdio");
>>>> @@ -649,7 +650,8 @@ static const struct brcmf_firmware_mapping
>>>> brcmf_sdio_fwnames[] = {
>>>>      BRCMF_FW_ENTRY(BRCM_CC_4339_CHIP_ID, 0xFFFFFFFF, 4339),
>>>>      BRCMF_FW_ENTRY(BRCM_CC_43430_CHIP_ID, 0x00000001, 43430A0),
>>>>      BRCMF_FW_ENTRY(BRCM_CC_43430_CHIP_ID, 0x00000002, 43430A1),
>>>> -    BRCMF_FW_ENTRY(BRCM_CC_43430_CHIP_ID, 0xFFFFFFFC, 43430B0),
>>>> +    BRCMF_FW_ENTRY(BRCM_CC_43430_CHIP_ID, 0x00000004, 43430C0),
>>
>> According to the revision mask your firmware seems to be for numerical
>> revision 2 of this chip...
>>
>>>> +    BRCMF_FW_ENTRY(BRCM_CC_43430_CHIP_ID, 0xFFFFFFF8, 43430B0),
>>
>> and for the b0 the chip revision is 3 (or higher). So the alphanumeric
>> revision of your chip would be 'a2' instead of 'c0'.
>
> i changed this to a2 for the next version of this series. But before i
> send them out, please doublecheck the kernel log 5.17-rc1 of my RPi Zero
> 2 W. I confuses me that the bluetooth part tells about BCM43430B0:
>
> [    9.653199] Bluetooth: hci0: BCM: chip id 115
> [    9.653749] Bluetooth: hci0: BCM: features 0x0e
> [    9.655466] Bluetooth: hci0: BCM43430B0
> [    9.655502] Bluetooth: hci0: BCM43430B0 (002.001.012) build 0000
> [    9.659512] vc4-drm soc:gpu: bound 3f400000.hvs (ops
> vc4_drm_unregister [vc4])
> [    9.667047] Bluetooth: hci0: BCM43430B0 'brcm/BCM43430B0.hcd' Patch
> [    9.668052] brcmfmac: brcmf_fw_alloc_request: using
> brcm/brcmfmac43430a2-sdio for chip BCM43430/2
> [    9.668567] brcmfmac mmc1:0001:1: Direct firmware load for
> brcm/brcmfmac43430a2-sdio.raspberrypi,model-zero-2-w.bin failed with
> error -2
> [    9.673724] vc4-drm soc:gpu: bound 3f400000.hvs (ops
> vc4_drm_unregister [vc4])
> [    9.697996] brcmfmac mmc1:0001:1: Direct firmware load for
> brcm/brcmfmac43430a2-sdio.raspberrypi,model-zero-2-w.txt failed with
> error -2
> [    9.816030] brcmfmac: brcmf_fw_alloc_request: using
> brcm/brcmfmac43430a2-sdio for chip BCM43430/2
> [    9.840128] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM43430/2
> wl0: Oct  9 2020 14:44:32 version 9.88.4.65 (test) (f149b32@shgit)
> (r679549) FWID 01-f40f3270
> [    9.919182] random: crng init done
> [    9.919200] random: 7 urandom warning(s) missed due to ratelimiting
> [   10.105524] vc4-drm soc:gpu: bound 3f400000.hvs (ops
> vc4_drm_unregister [vc4])
> [   10.118011] vc4-drm soc:gpu: bound 3f902000.hdmi (ops
> vc4_drm_unregister [vc4])
> [   10.118190] vc4-drm soc:gpu: bound 3f806000.vec (ops
> vc4_drm_unregister [vc4])
> [   10.118364] vc4-drm soc:gpu: bound 3f004000.txp (ops
> vc4_drm_unregister [vc4])
> [   10.118503] vc4-drm soc:gpu: bound 3f206000.pixelvalve (ops
> vc4_drm_unregister [vc4])
> [   10.118625] vc4-drm soc:gpu: bound 3f207000.pixelvalve (ops
> vc4_drm_unregister [vc4])
> [   10.118747] vc4-drm soc:gpu: bound 3f807000.pixelvalve (ops
> vc4_drm_unregister [vc4])
> [   10.118847] vc4-drm soc:gpu: bound 3fc00000.v3d (ops
> vc4_drm_unregister [vc4])
> [   10.119331] checking generic (1e330000 8ca000) vs hw (0 ffffffff)
> [   10.119339] fb0: switching to vc4 from simple
> [   10.122443] Console: switching to colour dummy device 80x30
> [   10.125147] [drm] Initialized vc4 0.0.0 20140616 for soc:gpu on minor 0
> [   10.203822] Console: switching to colour frame buffer device 240x75
> [   10.241067] vc4-drm soc:gpu: [drm] fb0: vc4drmfb frame buffer device
> [   10.414793] Bluetooth: hci0: BCM4343B0 37.4MHz wlbga_iLNA_iTR
> [Baseline: 0092]
> [   10.414822] Bluetooth: hci0: BCM43430B0 (002.001.012) build 0092
>
> Thanks




--000000000000979e3d05d6cc34db
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
XSlOP9s1dqWlRRnnNxV7BVC87lkKKy0+1M2DOF6qRYQlnW4EfOyCToYLAG5zeV+AjepMoX6J9bUz
yj4BlDtwH4HFjaRIlPPbdLshUA54/tV84x8woATuLGBq+hTZEpkZAgMBAAGjggHdMIIB2TAOBgNV
HQ8BAf8EBAMCBaAwgaMGCCsGAQUFBwEBBIGWMIGTME4GCCsGAQUFBzAChkJodHRwOi8vc2VjdXJl
Lmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcnQwQQYI
KwYBBQUHMAGGNWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24y
Y2EyMDIwME0GA1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3
dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMEkGA1UdHwRCMEAwPqA8oDqG
OGh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3Js
MCcGA1UdEQQgMB6BHGFyZW5kLnZhbnNwcmllbEBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYB
BQUHAwQwHwYDVR0jBBgwFoAUljPR5lgXWzR1ioFWZNW+SN6hj88wHQYDVR0OBBYEFKb+3b9pz8zo
0QsCHGb/p0UrBlU+MA0GCSqGSIb3DQEBCwUAA4IBAQCHisuRNqP0NfYfG3U3XF+bocf//aGLOCGj
NvbnSbaUDT/ZkRFb9dQfDRVnZUJ7eDZWHfC+kukEzFwiSK1irDPZQAG9diwy4p9dM0xw5RXSAC1w
FzQ0ClJvhK8PsjXF2yzITFmZsEhYEToTn2owD613HvBNijAnDDLV8D0K5gtDnVqkVB9TUAGjHsmo
aAwIDFKdqL0O19Kui0WI1qNsu1tE2wAZk0XE9FG0OKyY2a2oFwJ85c5IO0q53U7+YePIwv4/J5aP
OGM6lFPJCVnfKc3H76g/FyPyaE4AL/hfdNP8ObvCB6N/BVCccjNdglRsL2ewttAG3GM06LkvrLhv
UCvjMYICbTCCAmkCAQEwazBbMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1z
YTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMgUGVyc29uYWxTaWduIDIgQ0EgMjAyMAIMMSnY
h9J/RI6gsHbuMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCAHoEHmVR7UERlA0ZPe
IS2hhZ8/gfXOuQX3qZJPz0P8mjAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJ
BTEPFw0yMjAxMzAxMjU3MDdaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUDBAEqMAsGCWCGSAFl
AwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAmHPd0OEQORwTASqrFRug9xfHnWx0zelkuVTR
t8R2JtGlCXJPQDrLzlpZaROquhP6AT6O6eYfpFlMEXMgVVtC53QK6qEL1gH8WDkOSB2sdhKVZlJE
tW75516immdajsCTJQfcINxXEDknwHYB7mgz2XBItNDVxvtQXaEo584tXt5huyZ3aDRjm3NQdOmr
gGoitVaXzAleIgryi7NPmOnbxMsszmfl502WzZA6SeG39ab0QQVGnZ8eaIa08ec5aRGFGR0pLnVQ
PigNwpO4FFG6JTyW0UdJEMf9wNVQQp36GZ1XHoKf0iWhBpgzWr5obnwpwEV//rSgrq66KF0Ergaa
+A==
--000000000000979e3d05d6cc34db--
