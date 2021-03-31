Return-Path: <SRS0=X/nU=I5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1961FC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 04:13:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E394619DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 04:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E394619DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=js/LrvIsUaf6PyhdLHBwTU5j/9ew7NqGfBbXoiycmz0=; b=jBqyxKs2ZTh/KgnAuSUT2H+R+
	dU2tUIGQNdIuDF6gLaedeTZgCBSk+9Y4+NYJ3nPm7vYQHFCXaGBA1yWuTu9vjqaCCrLuK9WzlekMy
	zA2A2DqvHDc/We/Dpjp83ZEgh9FLMtr8A14AAJcJf/b9e7PSiYGDxYZIN7CLBI7+pyWlueG849eHs
	N6x/jopNCNYu/QWhYH+rGrSDkM/H+AbQk2YyPx5hzVfXaDziDjmBnM11htEatNauxuN/COc6b1VxT
	AGs85ZZxOgcBV1ZnpUFXCe4mNI1DPU7IjWmDbj9JQUAdV4M6jpQ0wdGJR2uToLBHrZxOCwe5KzdOW
	QE1VqIYFw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRSCc-005R6z-45; Wed, 31 Mar 2021 04:11:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRSBu-005R1n-Op
 for linux-arm-kernel@lists.infradead.org; Wed, 31 Mar 2021 04:10:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DDA8B619DF;
 Wed, 31 Mar 2021 04:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617163849;
 bh=I6fiXWkSVtLjfpjswEHIHaRV8x3+xRah91+v4N25RvU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZAWRYg2q6RLHolas/fEpDJP3jWp4LniKXXHCZaldvoECi2h5sVic5D+iO98WM8SWx
 pXY4nhLcnzOxam08J5NLI6Rj9cb88EAsEESKJqORhqqSvxXGPUeyu7D0lA/ELI6inV
 XLTTsI4uM+DshdufYLUF40PTSp6RpZ5dPB1/cHRodMcshEIJOKAFfXb7N61SVZIyMK
 s50sXkjYskYQUDe9wZgE0ocr1Q+SEJwE4/DcIpIJNwQ/s0v8aqwrGVpECrii5raOvQ
 YJIUtBQpDd43X58jD0sLntDI30FBQt3EFe2S1riwiVaDXAOTC5pJNOpXqe/HlJOUHA
 EW6EbwU+Zah7A==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
 kernel@pengutronix.de, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] i.MX defconfig change for 5.13
Date: Wed, 31 Mar 2021 12:10:19 +0800
Message-ID: <20210331041019.31345-6-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210331041019.31345-1-shawnguo@kernel.org>
References: <20210331041019.31345-1-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_051056_183963_95BC4FA5 
X-CRM114-Status: UNSURE (   7.12  )
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
Message-ID: <20210331041019.uo6HrVGn-UnaQ0ktzurijfOc2vnxVX1hTmjnuocoEWw@z>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBhMzhmZDg3NDg0NjQ4MzE1ODRhMTk0
MzhjYmIzMDgyYjVhMmRhYjE1OgoKICBMaW51eCA1LjEyLXJjMiAoMjAyMS0wMy0wNSAxNzozMzo0
MSAtMDgwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc2hhd25ndW8vbGludXgu
Z2l0IHRhZ3MvaW14LWRlZmNvbmZpZy01LjEzCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAg
dG8gOTRjNTg2ZTU5NDFhNDcyZmQxMTQ4MTVmMGVlZDJmMmJiNmI4M2ExMToKCiAgYXJtNjQ6IGNv
bmZpZ3M6IGVuYWJsZSBGbGV4VGltZXIgYWxhcm0gdGltZXIgKDIwMjEtMDMtMjkgMDk6MzY6MTYg
KzA4MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCmkuTVggZGVmY29uZmlnIGNoYW5nZSBmb3IgNS4xMzoKCkl0IGluY2x1
ZGVzIGEgbnVtYmVyIG9mIGFybTY0IGRlZmNvbmZpZyB1cGRhdGUgZm9yIGkuTVg4IGRldmljZXMK
c3VwcG9ydC4gIFRoZSBmb2xsb3dpbmcgb25lcyBtaWdodCBkZXNlcnZlIHNvbWUgbm90ZXMuCgot
IEFsdGhvdWdoIEhhbnRybyBkZWNvZGVyIGRyaXZlciBhcmUgc2l0dGluZyBpbiBzdGFnaW5nLCBw
ZW9wbGUgYWxyZWFkeQogIGZpbmQgaXQncyBxdWl0ZSB1c2VmdWwgb24gaS5NWDhNIGRldmljZXMu
Ci0gaS5NWCBQQ0llIGRyaXZlciBoYXMgbm8gb3B0aW9uIGZvciBtb2R1bGUgYnVpbGQuCi0gUkVB
TFRFS19QSFkgYmVjb21lcyBhIGJ1aWx0LWluIGRyaXZlciwgYmVjYXVzZSBpdCdzIHVzZWQgb24g
cXVpdGUgc29tZQogIGkuTVg4IHJlZmVyZW5jZSBib2FyZHMgd2hlcmUgcGVvcGxlIHdhbnQgdG8g
Ym9vdCB2aWEgTkZTLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBZHJpZW4gR3Jhc3NlaW4gKDEpOgogICAgICBhcm02NDog
ZGVmY29uZmlnOiBFbmFibGUgd204OTYwIGF1ZGlvIGRyaXZlci4KCkRvbmcgQWlzaGVuZyAoMSk6
CiAgICAgIGFybTY0OiBkZWZjb25maWc6IGFkZCBpbXg4cW0gcGluY3RybCBzdXBwb3J0CgpGYWJp
byBFc3RldmFtICgyKToKICAgICAgYXJtNjQ6IGRlZmNvbmZpZzogRW5hYmxlIHRoZSBIYW50cm8g
ZGVjb2RlcgogICAgICBhcm02NDogY29uZmlnczogU2VsZWN0IFJFQUxURUtfUEhZIGFzIGJ1aWx0
LWluCgpHdWlkbyBHw7xudGhlciAoMik6CiAgICAgIGFybTY0OiBkZWZjb25maWc6IEVuYWJsZSBk
ZXZmcmVxIHN1cHBvcnQgZm9yIGkuTVg4TVEKICAgICAgYXJtNjQ6IGRlZmNvbmZpZzogRW5hYmxl
IGFzb2Mgc2ltcGxlIG11eAoKSGVpa28gVGhpZXJ5ICgxKToKICAgICAgYXJtNjQ6IGNvbmZpZ3M6
IEVuYWJsZSBQQ0llIHN1cHBvcnQgZm9yIGlteDhtcSBib2FyZHMKCk1pY2hhZWwgV2FsbGUgKDEp
OgogICAgICBhcm02NDogY29uZmlnczogZW5hYmxlIEZsZXhUaW1lciBhbGFybSB0aW1lcgoKIGFy
Y2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcgfCAxMyArKysrKysrKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxp
c3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
