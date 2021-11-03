Return-Path: <SRS0=8DV1=PW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD9BC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Nov 2021 16:06:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFA9860F39
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Nov 2021 16:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFA9860F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0t4mTvalAafABzpuLUoxxJQkcZEme/vIDC5+WdBNPec=; b=joeCiY+1WmtbqB
	ffuaQDqMK0VNdp27kzLKndlt+0745f536HyIjKNQSl0zPL2uUaUGtcT5ZN6yzPWrAVfcAwyCkK2Bw
	OH++4Mfr5oMVJFIBrQ/RuwYWDn1wMRiD+ZojgBLWcfQHhsseZSrYP/U0y/gyRL4FbsbQrPSgfsQKD
	+So7P4ZRStLs2JsqZ9aPJb2Iz5HRsaP5ZfNGCJo8SATysB+013TyGD9vJ9FKPrjuMIqyiaidbFLOn
	vSzb5SHWc36eav6zpW7+3GMprxV+mO5raJAfwORySs0OBwTmVD0IVXke63aj1hVZFBSKBQBWOSZlz
	RNyQcaGDn+ogKw6Rrspg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miIkz-005djz-Jl; Wed, 03 Nov 2021 16:04:57 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miIkv-005dhl-3F
 for linux-arm-kernel@lists.infradead.org; Wed, 03 Nov 2021 16:04:54 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MsI4Q-1mSI6k1mGo-00tlWV for <linux-arm-kernel@lists.infradead.org>; Wed, 03
 Nov 2021 17:04:48 +0100
Received: by mail-wr1-f49.google.com with SMTP id d3so4323001wrh.8
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 03 Nov 2021 09:04:48 -0700 (PDT)
X-Gm-Message-State: AOAM531TiAlfpcPHBFXRdjBIy16FDWOVM51keQgrwUDGQZl9JL1PfnDc
 GfgPo571SbU9FVvcmFDTtSmOiL/hB48ILND687k=
X-Google-Smtp-Source: ABdhPJxBkWvfP3EmDGMtX833YMQlSSUKv+a0bU4ePxoC8shtlPKz7UQHdgSKNT9IU9/Zvyel4u3SU/YK78+sUEUWTN0=
X-Received: by 2002:a05:6000:10cb:: with SMTP id
 b11mr45324245wrx.71.1635955487857; 
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
X-Provags-ID: V03:K1:CVJINzyJZldqyPNXxJEDbnnGPzq28wnAGkgtV66+5iarmHUsKqM
 cBmcCrlha8rTKB40Zn+qpPRCQZm3LWtErNVNDOI4SOS968GNLsTrVpLgGaEp+GMduFXTP5G
 GLs3r6zg+QvPeCEFTIfWuJ3mzze/t2W15Gj2VA+vzaEARlhH5aYZ1UHV1qRv/WBXdBjFiQs
 ZD0cHDvC314ZBoEukJw0Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nuD1UDIY04E=:YKU76wSq8CQHundQVXxtED
 PCbpKg3Z58VwNF+n5zpLEiLWshb0nEoYE2gT2Nn+4nccIpT2vvgERz0xesp0Y5uhjzd1yC8Wu
 WsYLjGW2cflYKWY8fPCHbrSa52myv/T8Sr79OhNKjhT1i9PxjVyaugR8+0VCvNuX07uprhzL3
 qyixMh5V0n++wMscOBaYaqWZBNj9uNxBZWiU2wevL0jpu4Gu6TK1awh2l/0XOx4guZY6I7CfH
 MH+CKt0HZJsi6WU0U5pdM6JJFz/QugYnOYJxc0ac/ogASyhTTTUsVqS7OTOdAKmqnVXQ0JrpO
 xs/GEOFC5DAxXaPqUKPVvldplcBjbMiPAmYT8WE1Wb+/edXFo1Cl7hGZojfLJdoCeG+hkXGzD
 qszDNgs/4DF0JXgz7a01Tk54HX81r2mlatq0ligeNP39ZKVcW4enRMSwNuhgF9x3ZE7y4q+fa
 Xu06tIs34jMXkqY7QnMFTzHSt76xfXXR6aO0n8p4Q+L7oSOk3d4uov/rmLvv71tMADsOrAE5A
 2oTkWWVkkDiypUpqz8WbPQdUSnNuHEotkcumw/6S82BMFdq/ftLusf2w6bTVvqTNrDIDrdaPq
 DOfN7bCsju0QnQGSCRpEzCtfKjSwXdjN3Jx+Zl/xLjDFGDCxpmcCymxYSqKpBq9S2Q8fMyA1l
 kxCvEUuL+kWcdL+ihyJLJY7qWw1YJ9rpfUn3LtHzlfT7IZB1dI0TCVqfO8ApP2Lls25Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_090453_456904_A395D6EE 
X-CRM114-Status: GOOD (  14.48  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211103160431.XziJclhRiXzEbXN2ltqwfQgjdXnIz9fJk42K8aFO3W4@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
