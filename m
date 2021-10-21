Return-Path: <SRS0=6Q0g=PJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF73BC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 15:26:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 944AC60C49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 15:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 944AC60C49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vuEWWVdpVQKcpxJty99/lZ4PRxghbkdyrgU97XjY2vE=; b=Vpz5rkXPXIB7mY
	sGpQQkCFVhk1BM05jt/T4LLOY4HNAOGs6QPW/tHn4guTeTGjTybJOKA5Lma3dwZHVYri2li9Wt786
	05j6BYiQoXv9cD1BFdKz0WgxB2YRpR3mbkYfgpZ0/Ip242jBRniSjnt8tH7zz2OmQgcL2d1n0jrUv
	gm9AZF6J8OTjirJosBCqAlGQ03FzTgMAHDVwMRGADAw0E5jePXcuqOcPo4T24twNgsV8j8QUZ7G+Z
	LmLi9+kefdTnc89hrRbA45zdXf+DYDRWWxioImczct3Ms9g7UP7SQRjdRWdykwiwmjA5fzCPZQgWG
	EOgrPjrrCiCrb3NGmCUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdZw5-00864D-15; Thu, 21 Oct 2021 15:24:54 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdZpD-0083HQ-3z
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Oct 2021 15:17:48 +0000
Received: by mail-lf1-x135.google.com with SMTP id y15so2872108lfk.7
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 21 Oct 2021 08:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1mny4aFnqq/so1rrWHGvBW/GWX6no1JZVgdILHmhID4=;
 b=qCyIicNoOv2HmN+x6ltBwRdlqrlSY/ubDGsNs3WhSC/T4W3ZOAg5v/P4t3K0bBfz1s
 BWIWPdVTGAI28ncppEoEPpbn/mLVOixk4WKzJfjde20DCH54uQthho0iKsBf2+l4OvGG
 xPbWiQaYytnfX+r4wKzDhE6yQMecFQmiyEV2S1XL4tN72lxAw3r68n5pm+vCzIFT2Fws
 bRUXEHPED8+k5sJKn3BE5EjUT9Ezj5cw5u4NbX+CpKOU4MBZvwblvmpvdkWL3f7tM5uk
 0YM9yPw197JtQ6qW3J1PCpgPO8bWGq1HVasT0KA+8nmy7dwoRdIpAYxQ3KAq0DjaVYkX
 ZCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1mny4aFnqq/so1rrWHGvBW/GWX6no1JZVgdILHmhID4=;
 b=sCGGKWgEu4xocIKuOxmjPlLX27Jrzi1hZdwe8yZJZYqgGjtN0ouJIsEdUiw7BUms9M
 wJoa/I5qIj3C0FkTQkUSiJ+jN5or4yP8lG4D8O6RrWqa5pB8fHtLGOOLRaZNH7LnNvW1
 Y58KYtcIuncXeEgLYf5rmU5EjXavDe2+Re61pvuSmSGfWT+VxoZOgRD+dNLRh5WecvuN
 ZtzvcpZAsMnENyoBhy87wFcxCKuVFI90uiVpSYqbG3nMtRCnvM0hXpArkpIwyvKBQxFa
 MJm9znwgIo+BzqPmxP/EaK6LY1Y0940FWvP6iRkMoBTGND0xrl0akVcXmFaM0vb8tzKx
 l4RQ==
X-Gm-Message-State: AOAM530DHDUbE+mOqT8AUYSW+ALAXT8QBV/7j2Qwsws/cuTv+iOfS1Ib
 w4BttOtk1Y9SNJ25BTtG12ALgA==
X-Google-Smtp-Source: ABdhPJxHrJ3j7jtB38SX81sCzp9UWPik7BjA/bBTlE7m9NlwleHAlYDX4Q94f/nNjebP/hCxN/Nvkw==
X-Received: by 2002:a05:6512:12c8:: with SMTP id
 p8mr6167371lfg.42.1634829464947; 
 Thu, 21 Oct 2021 08:17:44 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
 by smtp.gmail.com with ESMTPSA id bt10sm91113lfb.193.2021.10.21.08.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:17:44 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, olof@lixom.net, soc@kernel.org, robh+dt@kernel.org,
 dinguyen@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@semihalf.com, mw@semihalf.com,
 ka@semihalf.com, jam@semihalf.com, tn@semihalf.com, amstan@google.com,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>,
 Joanna Brozek <jbrozek@antmicro.com>,
 Mariusz Glebocki <mglebocki@antmicro.com>,
 Tomasz Gorochowik <tgorochowik@antmicro.com>,
 Maciej Mikunda <mmikunda@antmicro.com>
Subject: [PATCH v5 1/1] dts: socfpga: Add Mercury+ AA1 devicetree
Date: Thu, 21 Oct 2021 17:17:36 +0200
Message-ID: <20211021151736.2096926-2-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021151736.2096926-1-pan@semihalf.com>
References: <20211021151736.2096926-1-pan@semihalf.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_081747_211099_3462DB9E 
X-CRM114-Status: GOOD (  16.02  )
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
Message-ID: <20211021151736.NgiYu034frLmgytncumC6nHshMFnq5u1OyipoOskiU8@z>

QWRkIHN1cHBvcnQgZm9yIHRoZSBNZXJjdXJ5KyBBQTEgbW9kdWxlIGZvciBBcnJpYSAxMCBTb0Mg
RlBHQS4KClNpZ25lZC1vZmYtYnk6IFBhd2XFgiBBbmlraWVsIDxwYW5Ac2VtaWhhbGYuY29tPgpT
aWduZWQtb2ZmLWJ5OiBKb2FubmEgQnJvemVrIDxqYnJvemVrQGFudG1pY3JvLmNvbT4KU2lnbmVk
LW9mZi1ieTogTWFyaXVzeiBHbGVib2NraSA8bWdsZWJvY2tpQGFudG1pY3JvLmNvbT4KU2lnbmVk
LW9mZi1ieTogVG9tYXN6IEdvcm9jaG93aWsgPHRnb3JvY2hvd2lrQGFudG1pY3JvLmNvbT4KU2ln
bmVkLW9mZi1ieTogTWFjaWVqIE1pa3VuZGEgPG1taWt1bmRhQGFudG1pY3JvLmNvbT4KLS0tCiBh
cmNoL2FybS9ib290L2R0cy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogLi4u
L2Jvb3QvZHRzL3NvY2ZwZ2FfYXJyaWExMF9tZXJjdXJ5X2FhMS5kdHMgIHwgMTEyICsrKysrKysr
KysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMTMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL3NvY2ZwZ2FfYXJyaWExMF9tZXJjdXJ5X2FhMS5k
dHMKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZSBiL2FyY2gvYXJtL2Jv
b3QvZHRzL01ha2VmaWxlCmluZGV4IDdlMDkzNDE4MDcyNC4uODAzNzAyODgzMTIyIDEwMDY0NAot
LS0gYS9hcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZQorKysgYi9hcmNoL2FybS9ib290L2R0cy9N
YWtlZmlsZQpAQCAtMTA3NSw2ICsxMDc1LDcgQEAgZHRiLSQoQ09ORklHX0FSQ0hfUzVQVjIxMCkg
Kz0gXAogCXM1cHYyMTAtdG9yYnJlY2suZHRiCiBkdGItJChDT05GSUdfQVJDSF9JTlRFTF9TT0NG
UEdBKSArPSBcCiAJc29jZnBnYV9hcnJpYTVfc29jZGsuZHRiIFwKKwlzb2NmcGdhX2FycmlhMTBf
bWVyY3VyeV9hYTEuZHRiIFwKIAlzb2NmcGdhX2FycmlhMTBfc29jZGtfbmFuZC5kdGIgXAogCXNv
Y2ZwZ2FfYXJyaWExMF9zb2Nka19xc3BpLmR0YiBcCiAJc29jZnBnYV9hcnJpYTEwX3NvY2RrX3Nk
bW1jLmR0YiBcCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zb2NmcGdhX2FycmlhMTBf
bWVyY3VyeV9hYTEuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvc29jZnBnYV9hcnJpYTEwX21lcmN1
cnlfYWExLmR0cwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjJhMzM2
NGIyNjM2MQotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3NvY2ZwZ2FfYXJy
aWExMF9tZXJjdXJ5X2FhMS5kdHMKQEAgLTAsMCArMSwxMTIgQEAKKy8vIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wCisvZHRzLXYxLzsKKworI2luY2x1ZGUgInNvY2ZwZ2FfYXJyaWEx
MC5kdHNpIgorCisvIHsKKworCW1vZGVsID0gIkVuY2x1c3RyYSBNZXJjdXJ5IEFBMSI7CisJY29t
cGF0aWJsZSA9ICJhbHRyLHNvY2ZwZ2EtYXJyaWExMCIsICJhbHRyLHNvY2ZwZ2EiOworCisJYWxp
YXNlcyB7CisJCWV0aGVybmV0MCA9ICZnbWFjMDsKKwkJc2VyaWFsMSA9ICZ1YXJ0MTsKKwkJaTJj
MCA9ICZpMmMwOworCQlpMmMxID0gJmkyYzE7CisJfTsKKworCW1lbW9yeUAwIHsKKwkJbmFtZSA9
ICJtZW1vcnkiOworCQlkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOworCQlyZWcgPSA8MHgwIDB4ODAw
MDAwMDA+OyAvKiAyR0IgKi8KKwl9OworCisJY2hvc2VuIHsKKwkJc3Rkb3V0LXBhdGggPSAic2Vy
aWFsMToxMTUyMDBuOCI7CisJfTsKK307CisKKyZlY2NtZ3IgeworCXNkbW1jYS1lY2NAZmY4YzJj
MDAgeworCQljb21wYXRpYmxlID0gImFsdHIsc29jZnBnYS1zZG1tYy1lY2MiOworCQlyZWcgPSA8
MHhmZjhjMmMwMCAweDQwMD47CisJCWFsdHIsZWNjLXBhcmVudCA9IDwmbW1jPjsKKwkJaW50ZXJy
dXB0cyA9IDwxNSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJCSAgICAgPDQ3IElSUV9UWVBFX0xF
VkVMX0hJR0g+LAorCQkJICAgICA8MTYgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkgICAgIDw0
OCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwl9OworfTsKKworJmdtYWMwIHsKKwlwaHktbW9kZSA9
ICJyZ21paSI7CisJcGh5LWFkZHIgPSA8MHhmZmZmZmZmZj47IC8qIHByb2JlIGZvciBwaHkgYWRk
ciAqLworCisJbWF4LWZyYW1lLXNpemUgPSA8MzgwMD47CisJc3RhdHVzID0gIm9rYXkiOworCisJ
cGh5LWhhbmRsZSA9IDwmcGh5Mz47CisKKwltZGlvIHsKKwkJI2FkZHJlc3MtY2VsbHMgPSA8MT47
CisJCSNzaXplLWNlbGxzID0gPDA+OworCQljb21wYXRpYmxlID0gInNucHMsZHdtYWMtbWRpbyI7
CisJCXBoeTM6IGV0aGVybmV0LXBoeUAzIHsKKwkJCXR4ZDAtc2tldy1wcyA9IDwwPjsgLyogLTQy
MHBzICovCisJCQl0eGQxLXNrZXctcHMgPSA8MD47IC8qIC00MjBwcyAqLworCQkJdHhkMi1za2V3
LXBzID0gPDA+OyAvKiAtNDIwcHMgKi8KKwkJCXR4ZDMtc2tldy1wcyA9IDwwPjsgLyogLTQyMHBz
ICovCisJCQlyeGQwLXNrZXctcHMgPSA8NDIwPjsgLyogMHBzICovCisJCQlyeGQxLXNrZXctcHMg
PSA8NDIwPjsgLyogMHBzICovCisJCQlyeGQyLXNrZXctcHMgPSA8NDIwPjsgLyogMHBzICovCisJ
CQlyeGQzLXNrZXctcHMgPSA8NDIwPjsgLyogMHBzICovCisJCQl0eGVuLXNrZXctcHMgPSA8MD47
IC8qIC00MjBwcyAqLworCQkJdHhjLXNrZXctcHMgPSA8MTg2MD47IC8qIDk2MHBzICovCisJCQly
eGR2LXNrZXctcHMgPSA8NDIwPjsgLyogMHBzICovCisJCQlyeGMtc2tldy1wcyA9IDwxNjgwPjsg
LyogNzgwcHMgKi8KKwkJCXJlZyA9IDwzPjsKKwkJfTsKKwl9OworfTsKKworJmdwaW8wIHsKKwlz
dGF0dXMgPSAib2theSI7Cit9OworCismZ3BpbzEgeworCXN0YXR1cyA9ICJva2F5IjsKK307CisK
KyZncGlvMiB7CisJc3RhdHVzID0gIm9rYXkiOworfTsKKworJmkyYzEgeworCXN0YXR1cyA9ICJv
a2F5IjsKKwlpc2wxMjAyMjogaXNsMTIwMjJANmYgeworCQlzdGF0dXMgPSAib2theSI7CisJCWNv
bXBhdGlibGUgPSAiaXNpbCxpc2wxMjAyMiI7CisJCXJlZyA9IDwweDZmPjsKKwl9OworfTsKKwor
LyogRm9sbG93aW5nIG1hcHBpbmdzIGFyZSB0YWtlbiBmcm9tIGFycmlhMTAgc29jZGsgZHRzICov
CismbW1jIHsKKwlzdGF0dXMgPSAib2theSI7CisJY2FwLXNkLWhpZ2hzcGVlZDsKKwlicm9rZW4t
Y2Q7CisJYnVzLXdpZHRoID0gPDQ+OworfTsKKworJm9zYzEgeworCWNsb2NrLWZyZXF1ZW5jeSA9
IDwzMzMzMDAwMD47Cit9OworCismdWFydDEgeworCXN0YXR1cyA9ICJva2F5IjsKK307CisKKyZ1
c2IwIHsKKwlzdGF0dXMgPSAib2theSI7CisJZHJfbW9kZSA9ICJob3N0IjsKK307Ci0tIAoyLjI1
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
cm0ta2VybmVsCg==
