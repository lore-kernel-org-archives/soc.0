Return-Path: <SRS0=F2nd=MG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7EC3C07E9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 04:56:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 952B6613AF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 04:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 952B6613AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EOCXe28DvYyRfkmc6229Y4QCC+6Bv/m6zno61QoyB+Y=; b=GyzGTm2tU1B7om
	P1xPYEk5jakAK+Yb9BIqAGPlaGHXoTxS/igbv28RgSbgcGD9XAsDzCxgvFec6Yjjf68v1tmO8iD55
	KdC/wqAcFqfj6+dMoh3rnDWlvFQ1IgvdnaP4rSMJxnk87WQcJdfxt9DgwKcs+wSEl+jn2t1FHt9Q2
	PF7Y70a3v6VtlDUYFtcpE9FjlDtHXrpL+9WpYpGWCVCJclObEhgRaOD+VH0jRwGwB96SqtpINC37H
	HWZwJ9YO2++J2K8p2BkkTslklPnwj9/aGcfUyQxmhFXKjzO1B/lIGUTYRjhQXrhTRs5fJG7DYpHcm
	rQ60TBhNFckeEMvAD3YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3Wuh-00CJSF-UU; Wed, 14 Jul 2021 04:54:28 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3WuL-00CJMS-Dn
 for linux-arm-kernel@lists.infradead.org; Wed, 14 Jul 2021 04:54:06 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1m3Wu8-0001DS-DH; Wed, 14 Jul 2021 06:53:52 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1m3Wu6-0002rw-IT; Wed, 14 Jul 2021 06:53:50 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, soc@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 1/4] dt-bindings: display: simple: add some Logic
 Technologies and Multi-Inno panels
Date: Wed, 14 Jul 2021 06:53:46 +0200
Message-ID: <20210714045349.10963-2-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714045349.10963-1-o.rempel@pengutronix.de>
References: <20210714045349.10963-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_215405_511141_AC5102B5 
X-CRM114-Status: GOOD (  10.65  )
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
Message-ID: <20210714045346.QrzJ51Eedk7t07l6Y_LZWQTRnynZDZK2CpQdJIG3iUk@z>

QWRkIExvZ2ljdGVjaG5vIGFuZCBNdWx0aS1Jbm5vIHBhbmVsczoKLSBMb2dpYyBUZWNobm9sb2dp
ZXMgTFRURDgwMHg0ODAgTDJSVCA3IiA4MDB4NDgwIFRGVCBSZXNpc3RpdmUgVG91Y2ggTW9kdWxl
Ci0gTG9naWMgVGVjaG5vbG9naWVzIExUVEQ4MDA0ODAwNzAtTDZXSC1SVCA34oCdIDgwMHg0ODAg
VEZUIFJlc2lzdGl2ZSBUb3VjaCBNb2R1bGUKLSBNdWx0aS1Jbm5vIFRlY2hub2xvZ3kgQ28uLEx0
ZCBNSTEwMTBBSVQtMUNQIDEwLjEiIDEyODB4ODAwIExWRFMgSVBTIENhcCBUb3VjaCBNb2QuCgpT
aWduZWQtb2ZmLWJ5OiBPbGVrc2lqIFJlbXBlbCA8by5yZW1wZWxAcGVuZ3V0cm9uaXguZGU+Ci0t
LQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1wbGUueWFt
bCAgICAgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3Bh
bmVsLXNpbXBsZS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvcGFuZWwtc2ltcGxlLnlhbWwKaW5kZXggYjM3OTdiYTI2OThiLi4xZTdiMjJhYWNl
NjMgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3BhbmVsL3BhbmVsLXNpbXBsZS55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS55YW1sCkBAIC0yMDIsOCArMjAyLDE0
IEBAIHByb3BlcnRpZXM6CiAgICAgICAtIGxvZ2ljdGVjaG5vLGx0MTYxMDEwLTJuaHIKICAgICAg
ICAgIyBMb2dpYyBUZWNobm9sb2dpZXMgTFQxNzA0MTAtMldIQyAxMC4xIiAxMjgweDgwMCBJUFMg
VEZUIENhcCBUb3VjaCBNb2QuCiAgICAgICAtIGxvZ2ljdGVjaG5vLGx0MTcwNDEwLTJ3aGMKKyAg
ICAgICAgIyBMb2dpYyBUZWNobm9sb2dpZXMgTFRURDgwMHg0ODAgTDJSVCA3IiA4MDB4NDgwIFRG
VCBSZXNpc3RpdmUgVG91Y2ggTW9kdWxlCisgICAgICAtIGxvZ2ljdGVjaG5vLGx0dGQ4MDA0ODAw
NzAtbDJydAorICAgICAgICAjIExvZ2ljIFRlY2hub2xvZ2llcyBMVFREODAwNDgwMDcwLUw2V0gt
UlQgN+KAnSA4MDB4NDgwIFRGVCBSZXNpc3RpdmUgVG91Y2ggTW9kdWxlCisgICAgICAtIGxvZ2lj
dGVjaG5vLGx0dGQ4MDA0ODAwNzAtbDZ3aC1ydAogICAgICAgICAjIE1pdHN1YmlzaGkgIkFBMDcw
TUMwMSA3LjAiIFdWR0EgVEZUIExDRCBwYW5lbAogICAgICAgLSBtaXRzdWJpc2hpLGFhMDcwbWMw
MS1jYTEKKyAgICAgICAgIyBNdWx0aS1Jbm5vIFRlY2hub2xvZ3kgQ28uLEx0ZCBNSTEwMTBBSVQt
MUNQIDEwLjEiIDEyODB4ODAwIExWRFMgSVBTIENhcCBUb3VjaCBNb2QuCisgICAgICAtIG11bHRp
LWlubm8sbWkxMDEwYWl0LTFjcAogICAgICAgICAjIE5FQyBMQ0QgVGVjaG5vbG9naWVzLCBMdGQu
IDEyLjEiIFdYR0EgKDEyODB4ODAwKSBMVkRTIFRGVCBMQ0QgcGFuZWwKICAgICAgIC0gbmVjLG5s
MTI4ODBiYzIwLTA1CiAgICAgICAgICMgTkVDIExDRCBUZWNobm9sb2dpZXMsTHRkLiBXUVZHQSBU
RlQgTENEIHBhbmVsCi0tIAoyLjMwLjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
