Return-Path: <SRS0=xXpd=OZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F7BC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 14:40:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 083BD613D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 14:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 083BD613D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EMgaE4pI84ebWfWzldemDcpelzEmwX31eEgyaEkPXws=; b=2KUwZSAApdFhVk
	DgGpIiS9Ztj5nhbINJtCcn0RygIQW1Wk2So2MQiRnlch+dvVzbUDAgpa9XPU65Wii3hraUXLConR9
	X6eguuVDs+115MhX8YUSAdwg/2eJbL3icTgJ85IT1b+4dIy2He3eYnAACAs2EzxFhFysNR89YVg2g
	ely7KmR6b9xrhaHhk0Vv/l1M1ADGoYX2ooYT2+ZslKccQQyk3G1mCnQ8DWR17zvA3y+W3KXOaDWJu
	P7R9HotD/fpsAxW7VzQIqUNtku5ClfTcC6G3uLbIK9LYFZuHFyxi0pKrAJtWOj6bRC1YYK43oY1BJ
	vp6agq3f8BCdv3UdmP4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXlaM-00AsPY-Bl; Tue, 05 Oct 2021 14:38:26 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXlaA-00AsNK-Nj
 for linux-arm-kernel@lists.infradead.org; Tue, 05 Oct 2021 14:38:15 +0000
Received: by mail-lf1-x12d.google.com with SMTP id i4so88026954lfv.4
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 05 Oct 2021 07:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=klTjczTUx8b1c2tX38XlKQEw8mKHpQEoY//ZV2AWwv8=;
 b=Dt8fAg1I9xPaomCa7reH7OK7NJBIuG3OckiqCfqYhOscZS+aDefAdl2iB6gSGYc9N8
 FWy4PDKwKyaeGINQDfSU+6/FBU8W2XimCAdNYeQAQ/yWL5WwZd6iCnfQQBRBP1g7DC6f
 vLM0zBqkF++xS5L5lTB3R/2D1vO5dxzLFDjFb50sfpu7WYK0pdYEvIi1gcO8GBaDGfnm
 fh1wWuUp7K97RzDezKc/7D1y1AK9c82a9Y8QmOT7ySgQYgQTM4LKqn1uWWEEW2t8q1uy
 FXPACkkrzTjyQMyaektNdKcOQ3M9x7HIp3bTHhSlCyhsoNjUWaaeTrWdBF6eUGbNP2SE
 ePWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=klTjczTUx8b1c2tX38XlKQEw8mKHpQEoY//ZV2AWwv8=;
 b=rqWVtgQ/lEuv+F7Tcnj3xkm0ZFfmyvXUl/WteCMXXywRAiwaSt8hao5AhTN5Vigkfw
 Zt9Jee6a0Deubh1qL7ZCl3VrGJak/agYsjgRxFJceHG5/667mNhBRPA27wbcPioTi9tV
 7J1t21L2xoPHjJ4jp+yk2mBBfo7LFA/CWIW/+ih9kQ3lwlaEZLXaH5J9o/2QhEwNvSVQ
 3PZecIO3Dc5tgI7Y7DI4mU1q4+iFkjnXGjCSfIoNW5l/wX5vxIY0pnaIiGFu0DgZk9Qf
 /9+5c3P1KyQl+c2nNd9uBj/Wq0TNtfwx4zqY0ubS5jGBVbc5Z/LISk1XxUewv//EIDOE
 7+vw==
X-Gm-Message-State: AOAM532fGsppPziD8jLCNoHv0B8wYe1wCT1WlEtob9MNdzXmTOyz48DU
 /JRCOGkC9IS/qSMEY/fdTYjG1g==
X-Google-Smtp-Source: ABdhPJyClsOWQd1HOJx8+kEKXL8GXAvDh/ETWKrerqxRvGr3pDmCfDtf3PwnNF8948g8MDS7LYIO4w==
X-Received: by 2002:a05:6512:32c1:: with SMTP id
 f1mr3769373lfg.471.1633444692745; 
 Tue, 05 Oct 2021 07:38:12 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
 by smtp.gmail.com with ESMTPSA id u25sm1973835lfc.176.2021.10.05.07.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 07:38:12 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 mika.westerberg@linux.intel.com, robh+dt@kernel.org,
 p.zabel@pengutronix.de, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
 dinguyen@kernel.org, p.yadav@ti.com, Tudor.Ambarus@microchip.com
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 alexandre.belloni@bootlin.com, sre@kernel.org, thunder.leizhen@huawei.com,
 Jonathan.Cameron@huawei.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ka@semihalf.com, tn@semihalf.com,
 jam@semihalf.com, amstan@google.com,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH v2 1/4] i2c: check bus number property in DesignWare I2C
 Controller
Date: Tue,  5 Oct 2021 16:37:45 +0200
Message-ID: <20211005143748.2471647-2-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005143748.2471647-1-pan@semihalf.com>
References: <20211005143748.2471647-1-pan@semihalf.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_073814_796875_96477400 
X-CRM114-Status: GOOD (  14.21  )
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
Message-ID: <20211005143745.KzSPsixDL4qG7NmMnTdV7Cu5_ERt2hASRD4vxiWs0nw@z>

T24gU29DRlBHQSBzeXN0ZW1zLCBpdCdzIGRlc2lyZWFibGUgdG8gaGF2ZSBmaXhlZCBudW1iZXJp
bmcgZm9yCmkyYyBidXNzZXMsIHdoaWxlIGJlaW5nIGFibGUgdG8gZW5hYmxlL2Rpc2FibGUgdGhl
bSAoZS5nLiBoYXZlIGkyYzEKYmUgbWFwcGVkIHRvIC9kZXYvaTJjLTEsIGV2ZW4gdGhvdWdoIGky
YzAgaXMgZGlzYWJsZWQpLiBUaGlzIGNhbiBhbHNvCmJlIGFjaGlldmVkIHVzaW5nIGRldmljZXRy
ZWUgYWxpYXNlcyAoc2VlIGkyY19hZGRfYWRhcHRlcikuIEhvd2V2ZXIsCmhhdmluZyB0aGUgZHJp
dmVyIGJlIHNlbGYtY29udGFpbmVkIHdpdGhvdXQgcmVseWluZyBvbiBhbGlhc2VzIGlzIG1vcmUK
cm9idXN0LgoKU2lnbmVkLW9mZi1ieTogUGF3ZcWCIEFuaWtpZWwgPHBhbkBzZW1paGFsZi5jb20+
Ci0tLQogZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1kZXNpZ253YXJlLXBsYXRkcnYuYyB8IDMgKyst
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1kZXNpZ253YXJlLXBsYXRkcnYuYyBiL2RyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtZGVzaWdud2FyZS1wbGF0ZHJ2LmMKaW5kZXggMjExMTM2NjVkZGVh
Li5mMjdlNmJjOWFkOWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtZGVzaWdu
d2FyZS1wbGF0ZHJ2LmMKKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1kZXNpZ253YXJlLXBs
YXRkcnYuYwpAQCAtMjgwLDcgKzI4MCw4IEBAIHN0YXRpYyBpbnQgZHdfaTJjX3BsYXRfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJCQkJSTJDX0NMQVNTX0hXTU9OIDogSTJD
X0NMQVNTX0RFUFJFQ0FURUQ7CiAJQUNQSV9DT01QQU5JT05fU0VUKCZhZGFwLT5kZXYsIEFDUElf
Q09NUEFOSU9OKCZwZGV2LT5kZXYpKTsKIAlhZGFwLT5kZXYub2Zfbm9kZSA9IHBkZXYtPmRldi5v
Zl9ub2RlOwotCWFkYXAtPm5yID0gLTE7CisJaWYgKG9mX3Byb3BlcnR5X3JlYWRfdTMyKHBkZXYt
PmRldi5vZl9ub2RlLCAiYnVzbm8iLCAmYWRhcC0+bnIpKQorCQlhZGFwLT5uciA9IC0xOwogCiAJ
aWYgKGRldi0+ZmxhZ3MgJiBBQ0NFU1NfTk9fSVJRX1NVU1BFTkQpIHsKIAkJZGV2X3BtX3NldF9k
cml2ZXJfZmxhZ3MoJnBkZXYtPmRldiwKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0
CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
