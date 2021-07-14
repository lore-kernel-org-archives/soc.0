Return-Path: <SRS0=F2nd=MG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A3BC07E9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 16:39:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF173613B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 16:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF173613B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1dynVki1FjDmRkZEsascUqZSuBIL9wZcR+m0e2wgok=; b=CAMrstnVMl/8UX
	zJWmlfKSKPnnrqmtM/+0g24B+YecucZ0LXRienvF8qYJqsKeAt68VmSSO9o+jGde3wNmvs6svFeVa
	MaKoNic9pv/HjgQ+x4eqRqsiMsly6dFJkvG2YaWcksy2agYRQMXyufTpygooLYgOy45lyeeHxFfII
	EQN5cNXj2maTNPWgd84WAGwLrs8Trbz/jWNce7kFU4DvoxYV5Bkn06s7FqSmgpFp56ZGp5KghYPdw
	XqZ0lvicNE7yeWzzTyqfwRzzvBWw+cLH2AP20u4J07pfKPO9VZXEYJOGXxxZi+HjOX8EP7sB60vTt
	RyUcDn7xPnQiqx4ZinNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3hsw-00E6i1-Gv; Wed, 14 Jul 2021 16:37:22 +0000
Received: from mail-io1-f53.google.com ([209.85.166.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3hsp-00E6gl-L3
 for linux-arm-kernel@lists.infradead.org; Wed, 14 Jul 2021 16:37:16 +0000
Received: by mail-io1-f53.google.com with SMTP id k16so2876345ios.10
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 14 Jul 2021 09:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=E4AvJhetNwASZem5dl8Fp/vANmJkc1r/xjwo+QbtJNI=;
 b=L5p2KjF6835BthLsJGwOYRkeUMJGIfIGxMWUs6VfhuqY+NUPCbiYtizvSqVE46zlgc
 IoO+ziMXb3o+p6usFCgXnk6fIdQZocWOcSQNJVxY3iXNSCCAgj3J0zLo3xhsPV0dN/KT
 sdmoYSQw4dkQiJ+7uG+drn2cMxUFi3lXnjRCO1CuyNMYlutkiQ63C1Q1TI3saT5RBTtT
 Ynn2AzhfsRSKvcYhqtaLArvjzpUE9D+ZJII2qj0WA4rlqFh7I1u7oWV3oahOhoIWSUs4
 kKTT4jzFV9ingOJIe9+eeBImt3j8A1wDtnehlfohD6iN0I9LjyAb+NLvD1xtpR/YOZqt
 r2dg==
X-Gm-Message-State: AOAM530tWNjTL9bqqO80afWTlN1nGmrWpXeXH8slDFzMg4Up7I0JZsMm
 1CLkucyFCsx2aZ1dxIErWw==
X-Google-Smtp-Source: ABdhPJyyqzjI4orQEKBGudclxA6i5CqYo1oBoYaIfnzXMXkj0ILABCTs+SeLuzpf8Is17w4C3VeFtg==
X-Received: by 2002:a02:ad08:: with SMTP id s8mr9861761jan.40.1626280634475;
 Wed, 14 Jul 2021 09:37:14 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id r1sm1078472ilt.37.2021.07.14.09.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 09:37:13 -0700 (PDT)
Received: (nullmailer pid 2719225 invoked by uid 1000);
 Wed, 14 Jul 2021 16:37:10 -0000
Date: Wed, 14 Jul 2021 10:37:10 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: David Airlie <airlied@linux.ie>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Shawn Guo <shawnguo@kernel.org>,
 dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: display: simple: add some Logic
 Technologies and Multi-Inno panels
Message-ID: <20210714163710.GA2718995@robh.at.kernel.org>
References: <20210714045349.10963-1-o.rempel@pengutronix.de>
 <20210714045349.10963-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714045349.10963-2-o.rempel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_093715_737410_1FF11633 
X-CRM114-Status: GOOD (  13.54  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210714163710.3S9hPEQcQA2XoiryYpCRtCjRdrCEQCXH9f_U8mCDQEI@z>

T24gV2VkLCAxNCBKdWwgMjAyMSAwNjo1Mzo0NiArMDIwMCwgT2xla3NpaiBSZW1wZWwgd3JvdGU6
Cj4gQWRkIExvZ2ljdGVjaG5vIGFuZCBNdWx0aS1Jbm5vIHBhbmVsczoKPiAtIExvZ2ljIFRlY2hu
b2xvZ2llcyBMVFREODAweDQ4MCBMMlJUIDciIDgwMHg0ODAgVEZUIFJlc2lzdGl2ZSBUb3VjaCBN
b2R1bGUKPiAtIExvZ2ljIFRlY2hub2xvZ2llcyBMVFREODAwNDgwMDcwLUw2V0gtUlQgN+KAnSA4
MDB4NDgwIFRGVCBSZXNpc3RpdmUgVG91Y2ggTW9kdWxlCj4gLSBNdWx0aS1Jbm5vIFRlY2hub2xv
Z3kgQ28uLEx0ZCBNSTEwMTBBSVQtMUNQIDEwLjEiIDEyODB4ODAwIExWRFMgSVBTIENhcCBUb3Vj
aCBNb2QuCj4gCj4gU2lnbmVkLW9mZi1ieTogT2xla3NpaiBSZW1wZWwgPG8ucmVtcGVsQHBlbmd1
dHJvbml4LmRlPgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVs
L3BhbmVsLXNpbXBsZS55YW1sICAgICB8IDYgKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKykKPiAKCgpQbGVhc2UgYWRkIEFja2VkLWJ5L1Jldmlld2VkLWJ5IHRhZ3Mgd2hl
biBwb3N0aW5nIG5ldyB2ZXJzaW9ucy4gSG93ZXZlciwKdGhlcmUncyBubyBuZWVkIHRvIHJlcG9z
dCBwYXRjaGVzICpvbmx5KiB0byBhZGQgdGhlIHRhZ3MuIFRoZSB1cHN0cmVhbQptYWludGFpbmVy
IHdpbGwgZG8gdGhhdCBmb3IgYWNrcyByZWNlaXZlZCBvbiB0aGUgdmVyc2lvbiB0aGV5IGFwcGx5
LgoKSWYgYSB0YWcgd2FzIG5vdCBhZGRlZCBvbiBwdXJwb3NlLCBwbGVhc2Ugc3RhdGUgd2h5IGFu
ZCB3aGF0IGNoYW5nZWQuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYXJtLWtlcm5lbAo=
