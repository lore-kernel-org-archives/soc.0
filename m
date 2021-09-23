Return-Path: <SRS0=WZ3G=ON=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3439C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Sep 2021 06:35:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4CF86103D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Sep 2021 06:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4CF86103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=57bdj1BWC0QU+pcKyB02HJ22YpR6AKylDSEkKmjNIFs=; b=TQSl0p2qn2AyNJ
	9YuGnYNvYKMpiAztbOfzSDeRmwEYAfbp5rj+2KPMlevILu7B0daXxKU8i+CDcGhmYNdxvgJiwBEcx
	n0zkUEG36q7IvKFOMXxrct/OWTl9PI4YLsr5Y/CcqPFw7yd+UJ/OmotLYwCHAg7cW6ilCtvQ+1zXh
	Tw7ZI0C0J8iaJihVDntRv2TxH180jfbFelC3IYbn9V2D3X8KIxMPxgdjjQfEvM89AvHwfZlEqco79
	aLEZMwJazCeBJkktsXMF3wBMbUOlQMaVhNZo5nKj7hGiwR1AJqo1uoKczY5+DzntY8CinBsw0nHeU
	FsvjRpoq9WujWk/JEnXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTIJ8-00AO1Y-Qi; Thu, 23 Sep 2021 06:34:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTIJ5-00AO0r-35
 for linux-arm-kernel@lists.infradead.org; Thu, 23 Sep 2021 06:34:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1D576103D;
 Thu, 23 Sep 2021 06:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632378846;
 bh=aVnY3qupI8HisDSAgQV1WYTf85N8gCMRXHmkRiCT0WU=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=i+L4HqfJVbJqElZcTxTP1l7xnEjGI159sm6vUGodIl0uh5mSZiPzTKgrf4Llhukid
 3GlAKM0txjeil3tAq8fBOPjaIGe5EPX8lWWBbnqUBygVe0lZANkQtQo51nZGT1JXpv
 rENBkhtt91InvWFUHc79g2dheb9wpUnWWJoTXrcLYPY/fbefWQ3l+pNsOQJrg08UtC
 1YescDmkP2MDqM1llE7KWSCVmIKaKNN5RBuFRSqXHeNwzeYlRMt9lnDqkDYoG4K5V4
 LWdlgH9+9o24xXpFzp2p966sxwAZERYpfPV7qixxnspwVMLzuz7HiePD4mOqhKjqXb
 QL7fdldLTohaQ==
Date: Thu, 23 Sep 2021 14:34:00 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
 Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
 linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.15
Message-ID: <20210923063356.GK13480@dragon>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210922_233407_200317_42DF62C3 
X-CRM114-Status: UNSURE (   9.03  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210923063400.C9px-pEWoH9URu3V03eUhpktaEIopySQrbP5Alig8cs@z>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA2ODgwZmE2YzU2NjAxYmI4ZWQ1OWRm
NmMzMGZkMzkwY2M1ZjZkZDhmOgoKICBMaW51eCA1LjE1LXJjMSAoMjAyMS0wOS0xMiAxNjoyODoz
NyAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc2hhd25ndW8vbGludXgu
Z2l0IHRhZ3MvaW14LWZpeGVzLTUuMTUKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBj
NTQ0Njc0ODJmZmQ0MDdhNDQwNGM5OTA2OTdmNDMyYmZjYjZjZGM0OgoKICBBUk06IGlteF92Nl92
N19kZWZjb25maWc6IGVuYWJsZSBmYiAoMjAyMS0wOS0yMiAxNjo0NzozNCArMDgwMCkKCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KaS5NWCBmaXhlcyBmb3IgNS4xNToKCi0gUmV2ZXJ0IGNjODg3MGJmNGMzYSB0byBmaXggdGhl
IHJlZ3Jlc3Npb24gb24gaS5NWDYgdGhhdCBzdXNwZW5kCiAgc3VwcG9ydCBiZWNvbWVzIGJyb2tl
bi4KLSBBZGQgYHFjYSxjbGstb3V0LWZyZXF1ZW5jeWAgcHJvcGVydHkgdG8gZml4IEV0aGVybmV0
IHN1cHBvcnQgb24KICBpbXg2cWRsLXBpY28gYm9hcmQuCi0gUmUtZW5hYmxlIEZCIHN1cHBvcnQg
aW4gaW14X3Y2X3Y3X2RlZmNvbmZpZy4gIEl0IGdldHMgbG9zdCBkdWUgdG8KICBmNjExYjFlNzYy
NGMgKCJkcm06IEF2b2lkIGNpcmN1bGFyIGRlcGVuZGVuY2llcyBmb3IgQ09ORklHX0ZCIikuCi0g
Rml4IExQNTU2MiBMRUQgc3VwcG9ydCBvbiBpbXg2ZGwteWFwcDQgYm9hcmQuCi0gQWRkIG1pc3Np
bmcgcGluY3RybC1uYW1lcyBmb3IgcGFuZWwgb24gTTUzTWVubG8gYm9hcmQuCi0gRml4IFVTQiBo
b3N0IHBvd2VyIHJlZ3VsYXRvciBwb2xhcml0eSBvbiBNNTNNZW5sbyBib2FyZC4KCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
RmFiaW8gRXN0ZXZhbSAoMik6CiAgICAgIFJldmVydCAiQVJNOiBpbXg2cTogZHJvcCBvZl9wbGF0
Zm9ybV9kZWZhdWx0X3BvcHVsYXRlKCkgZnJvbSBpbml0X21hY2hpbmUiCiAgICAgIEFSTTogZHRz
OiBpbXg2cWRsLXBpY286IEZpeCBFdGhlcm5ldCBzdXBwb3J0CgpNYXJjZWwgWmlzd2lsZXIgKDEp
OgogICAgICBBUk06IGlteF92Nl92N19kZWZjb25maWc6IGVuYWJsZSBmYgoKTWFyZWsgVmFzdXQg
KDIpOgogICAgICBBUk06IGR0czogaW14OiBBZGQgbWlzc2luZyBwaW5jdHJsLW5hbWVzIGZvciBw
YW5lbCBvbiBNNTNNZW5sbwogICAgICBBUk06IGR0czogaW14OiBGaXggVVNCIGhvc3QgcG93ZXIg
cmVndWxhdG9yIHBvbGFyaXR5IG9uIE01M01lbmxvCgpNaWNoYWwgVm9rw6HEjSAoMSk6CiAgICAg
IEFSTTogZHRzOiBpbXg2ZGwteWFwcDQ6IEZpeCBscDU1NjIgTEVEIGRyaXZlciBwcm9iZQoKIGFy
Y2gvYXJtL2Jvb3QvZHRzL2lteDUzLW01M21lbmxvLmR0cyAgICAgICB8ICA0ICsrLS0KIGFyY2gv
YXJtL2Jvb3QvZHRzL2lteDZkbC15YXBwNC1jb21tb24uZHRzaSB8ICA1ICsrKysrCiBhcmNoL2Fy
bS9ib290L2R0cy9pbXg2cWRsLXBpY28uZHRzaSAgICAgICAgfCAxMSArKysrKysrKysrKwogYXJj
aC9hcm0vY29uZmlncy9pbXhfdjZfdjdfZGVmY29uZmlnICAgICAgIHwgIDEgKwogYXJjaC9hcm0v
bWFjaC1pbXgvbWFjaC1pbXg2cS5jICAgICAgICAgICAgIHwgIDMgKysrCiA1IGZpbGVzIGNoYW5n
ZWQsIDIyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlz
dApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
