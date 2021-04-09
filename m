Return-Path: <SRS0=+Itf=JG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61924C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 20:02:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB61A61104
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 20:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB61A61104
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zWlzpQnVS5qlXaBLkZByCNpbphDoS9ocoSIMuq5OMnc=; b=lnvtc8RzNI49CsxiSUIH296gq
	4c6zXvMBD2imyrG8QZ1BRRwTFXpHLy8o05VSX7tcRq1uaCdjKc2RIiOyIBR88cknJHOMKIJ2Wj1j3
	SW3rS8TbqjidAZzWwMedkUc0D3aaZuC/vPty+8sE6lylC2y9Y4e/oVrXMZptEymQSELnOtciLMKM6
	jNwDICLE68dzSuvqAgnUNtVNjvW84SRpUJKuAhnRc/jkBV7alLF0my47GN8AmiN/1Js4FqmjuOyyr
	iY8CMMZ93NjTYtt4inwcwfI5q3KCWpaA+3G+TGrwD9OJy5o3M93FqtwvtyAaHKH3GkvKaGCjVzMey
	OBvstcqIA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUxE0-001S0E-O3; Fri, 09 Apr 2021 19:55:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUxDd-001Rxe-ST
 for linux-arm-kernel@desiato.infradead.org; Fri, 09 Apr 2021 19:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:List-Id:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=eDHI6RzT2FXawSvFvnPdPdpf/zSJKVY4/2BRWI7+sUw=; b=zTfQxNEwGhw+kwbEEnKN+f8xYX
 G7yxppx1ukn+sD1i0RcNHQrYDeXd3Zkx8/9nWkSO6SQ0+dImiAHTlCo5xcim3x5bq9Qh/iq2YM0Zq
 3BVkuQYGm52gRuHsbjOerGAlUgUywYVso18iH//VrC6wT/56GcfRRjsKhsZ5k4afJ4fmZQyha6mVL
 7rbAbMqGZ2Rsi/YuwUpwl3PGcMPGkGUmqbJjFiY7lejqpAC7UhDFk3RHXAC4zy3fV1lSDzcIcFE9j
 8GO5xtr3mP1c+3YsayANtRlioqWUZp+EcCVf3NxFHfPLHw6SDRuhbBZnMoP45TEYh5FGGonvsz7y/
 ImOjR/gg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUxDb-004m0N-Dh
 for linux-arm-kernel@lists.infradead.org; Fri, 09 Apr 2021 19:55:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0ECF610CA;
 Fri,  9 Apr 2021 19:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617998103;
 bh=nCtEdRhW89YXTx2iWEJ+OoLpmlFebL7FXdfZQQWfs6s=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qlbEnXBxpoHdbKIMnTSwROw09edcaCeQJM5AZX6iXxMSG0lo9OX7+rzuBCy+9iUT8
 M+d4IfxH8pMYFl9z8znD0yNtFVVqaRLLjjnMo4xCcM9rajyOWpTDBRXteOg9WGKzXO
 gYbJm3Jdc4yIwye1VOaDe3W/c+545azjNJXrP0WGHB8TnJZlp4YU9JZz6zjEPoHLVY
 XarnaBAAQ+80YNSDXl3ozsr6OLYhm1GVBjp1MyiUZZAnO3G6stJEiiMiDE2/siYt1X
 LlHxpDSzqOI+/VBWfiFXIsMIiyJTpGx1HxeQArecpl3uFmmclSZQyg8N8sgy38Iy18
 IV0D9u8rM5dRA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, soc@kernel.org,
 arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Luca Weiss <luca@z3ntu.xyz>,
 linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Olof Johansson <olof@lixom.net>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Qualcomm dts updates for v5.13
Date: Fri,  9 Apr 2021 21:54:53 +0200
Message-ID: <161799808686.1862218.8412636987649764617.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210409162359.776076-1-bjorn.andersson@linaro.org>
References: <20210409162359.776076-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_125503_502303_779D3F1F 
X-CRM114-Status: UNSURE (   6.65  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210409195453.124FX6_SFzPD3OVVCi8pnwCo-CgUQjGp8R9EZ-LWI68@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 9 Apr 2021 11:23:59 -0500, Bjorn Andersson wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.13
> 
> [...]

Merged into arm/dt, thanks!

merge commit: e8adf27e9766525ebedb8e6607c023997f93c353

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
