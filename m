Return-Path: <SRS0=xXpd=OZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD0CC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 05:42:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E51661074
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 05:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E51661074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tedukNAm9AZpK1Wwpfzw5bZsUHBC73ctmZPCvZJag/0=; b=lQ9Pp1wz//WsS9
	oVRvU0EuVTRbaiEVOlchO4x2aBhXn24eUcQygZ4q5oC6lKpQIQ8oUWXYRvMkkuDn4P68dzrlMa34R
	b9ANnJPPpvgBMOsZc9aoK6EqSC13KmwdCpjg22CpBHyXUV0HsyUwujH9ubOz1R6ZGwcNV132qJxBW
	/+IwTmEG5S7mL9/OcproORkVJ1foHRtzJJ/mZvdGfDJXKlTqY4KD/iGsZKFWvBwMGX6WBi9gQjjKv
	+g9JSYS6vBesHtuvnQ5bje838FFSJjiNkEo80pOLYVpXSZTJoVmT4c4p0RVKyXL3hUtSOQ/x/q3YD
	6DNfIvoPIXR1RFPjouQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXdCD-008zzd-FQ; Tue, 05 Oct 2021 05:40:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXdC9-008zz4-9M
 for linux-arm-kernel@lists.infradead.org; Tue, 05 Oct 2021 05:40:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A60A6124F;
 Tue,  5 Oct 2021 05:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633412452;
 bh=w5ucb4+0Z/Zj+8BnKuW+MTsTn0BjzDzqBW39H/ChTqA=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=iRNrQdxr7tHjn+h9xtVu7o4j9nAsIqmagzTGU/kESiPKuUzrymvzttyL4u2ZrnGu3
 IEiF846SjAt7jO7Zl4sfWp97hfn6J45HF3om1o3tZj+/uSVg08V3rrqb8V2j7t4Cs+
 VL2qUIIRwjm92d2zJMwDkDcFV/DygcUBYeSHTzOzkmbxUE+pWVYW+4ijM4qDSZeGuR
 rQyid+YuIFSXyB+E3rdcvqN9vxgrOYnC8ZeKAcjP6iEsLM3jlcdEu6PBdPQZ93BmcP
 dM8ygvFM+pFbIXqzrmKEtT3YYTIsYEgB6Q6bpbEsP2G/0cGE/3Y85V3vEgj7Mf2aCF
 DRKzCOl17j7dA==
Date: Tue, 5 Oct 2021 13:40:46 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, krzk@kernel.org, leoyang.li@nxp.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/4] ARM: dts: add E70K02 based eBook readers
Message-ID: <20211005054037.GL20743@dragon>
References: <20210924085832.2560317-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210924085832.2560317-1-andreas@kemnade.info>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_224053_365138_9F0B18BE 
X-CRM114-Status: GOOD (  12.36  )
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
Message-ID: <20211005054046.2t6dHM4VnIrdCs9C6SbmnrXjEp3i0RKppZM7q8WDvwI@z>

On Fri, Sep 24, 2021 at 10:58:28AM +0200, Andreas Kemnade wrote:
> Add devicetrees for E70K02 based ebook readers. 
> Name on mainboard is: 37NB-E70K0M+6A3
> Serials start with: E70K02 (a number also seen in vendor kernel
> sources).
> 
> These boards are found in the Kobo Libra H2O with an i.MX6SLL and
> in the Tolino Vision 5 with an i.MX6SL.
> 
> Work is based on code from the vendor kernel at
> https://github.com/kobolabs/Kobo-Reader/blob/master/hw/imx6sll-librah2o/kernel.tar.bz2
> but things need to be heavily reworked due to
> incompatible bindings.
> 
> Changes in v2:
> 
> Node names style cleanup, mainly mmc stuff, s/_/-/
> 
> Andreas Kemnade (4):
>   dt-bindings: arm: fsl: Add E70K02 based ebook readers
>   ARM: dts: add Netronix E70K02 board common file
>   ARM: dts: imx: add devicetree for Kobo Libra H2O
>   ARM: dts: imx: add devicetree for Tolino Vision 5

Applied all, thanks!

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
